class PaymentSerializer < ActiveModel::Serializer
  attributes :id, :amount, :phone_number, :ticket_format, :vip_tickets, :regular_tickets, :response, :CheckoutRequestID, :event_id, :MerchantRequestID, :state, :code, :user_id
end
