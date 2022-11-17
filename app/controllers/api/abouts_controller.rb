class Api::AboutsController < ApplicationController
    skip_before_action :authorized
    
    def index
        @about = About.all
        render json: @about, status: :ok
    end
end
