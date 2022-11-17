class Api::PaymentsController < ApplicationController
    skip_before_action :authorized, only: [:callback]

    def index
        @payments = Payment.all
    end

    def payment
        phone = PhonyRails.normalize_number(params[:phone_number], country_code: 'KE').gsub(/\W/, '')
        payZ = current_user.payments.create!(amount: params[:amount], phone_number: phone, ticket_format: params[:ticket_format], event_id: params[:event_id], user_id: params[:user_id], vip_tickets: params[:vip_tickets], regular_tickets: params[:regular_tickets])
        render json: payZ, status: :created
    end

    def callback
        merchantrequestID = params[:Body][:stkCallback][:MerchantRequestID]
        checkoutrequestID = params[:Body][:stkCallback][:CheckoutRequestID]
    
        amount,mpesareceiptnumber,transactiondate,phonenumber=nil
        if params[:Body][:stkCallback][:CallbackMetadata].present?
          params[:Body][:stkCallback][:CallbackMetadata][:Item].each do |item|
            case item[:Name].downcase
            when 'amount'
              amount = item[:Value]
            when 'mpesareceiptnumber'
              mpesareceiptnumber = item[:Value]
            when 'transactiondate'
              transactiondate = item[:Value]
            when 'phonenumber'
              phonenumber = item[:Value]
            end
          end
    
          pay = Payment.find_by(amount: amount, phone_number: phonenumber, CheckoutRequestID: checkoutrequestID, MerchantRequestID: merchantrequestID)
          pay.state = true
          pay.code = mpesareceiptnumber
          pay.save
    
          render json: 'received'
        else
          pay = Payment.find_by(CheckoutRequestID: checkoutrequestID, MerchantRequestID: merchantrequestID)
          pay.code = params["Body"]["stkCallback"]["ResultDesc"]
          pay.save
        end
        
        Transaction.create({ callback: params, CheckoutRequestID: checkoutrequestID, MerchantRequestID: merchantrequestID }) 

    end

    def details
        payment = find_payment
        render json: payment, status: :ok
    end

    def transaction_details
        transaction = Transaction.find_by(CheckoutRequestID: params[:CheckoutRequestID], MerchantRequestID: params[:MerchantRequestID])
        render json: transaction, status: :ok
    end

    private

    def find_payment
        Payment.find_by(id: params[:id])
    end

end
