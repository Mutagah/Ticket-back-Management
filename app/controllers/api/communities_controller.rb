class Api::CommunitiesController < ApplicationController
    skip_before_action :authorized
    
    def index
        @communities = Community.all
       render json: @communities, status: :ok
    end
end
