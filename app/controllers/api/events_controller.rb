class Api::EventsController < ApplicationController
    load_and_authorize_resource
    skip_before_action :authorized, only: [:index, :show]
    
    def index 
        render json: Event.all,status: :ok
    end
    
    def show
        event = find_event
        render json: event, status: :ok
    end

    def create
        event = current_user.events.create!(event_params)   
        render json: event, status: :created
    end

    def update
        @current_event = find_event
        @current_event.update!(event_params)
        render json: @current_event,status: :accepted
    end

    def destroy
        event = find_event
        event.destroy
        render json: {yeeted: "Event Deleted Successfully!"}, status: :ok
    end

    private
    def find_event
        Event.find_by(id: params[:id])
    end

    def event_params
        params.permit(:category_id,:title,:event_start_date,:event_end_date, :ticket_format,:early_booking_end_date,:early_booking_price_regular,:early_booking_price_vip,:location,:regular_price,:vip_price,:vip_no_of_tickets,:regular_no_of_tickets,:banner_img,:description,:image_url1,:image_url2)
    end

end
