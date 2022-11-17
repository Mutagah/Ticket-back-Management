class Api::TicketsController < ApplicationController

    #Tickets should deal with mpesa and other payment options
    #UserAttended will be used for displaying events users bought
    
    def index
        render json: Ticket.all, status: :ok
    end

    def create
        ticket = current_user.tickets.create!(ticket_params)
        render json:{message: "You have successfully booked your ticket"}
    end

    def update
        ticket = find_ticket
        current_user.tickets.update(ticket_updateparams)
        render json: ticket
    end

    def destroy
        ticket = find_ticket
        current_user.tickets.destroy
        head :no_content
    end

    private

    def find_ticket
        Ticket.find_by(id: params[:id])
    end

    def ticket_params
        params.permit(:ticket_no, :user_id, :event_id, :number_of_vip_tickets,:number_of_regular_tickets)
    end

    def ticket_updateparams
        params.permit(:number_of_vip_tickets,:number_of_regular_tickets)
    end
end
