class Api::LoginSlidesController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]

    def index
        slides = LoginSlide.all
        render json: slides, status: :ok
    end

    def show
        slide = LoginSlide.find_by!(id: params[:id])
        render json: slide, status: :ok
    end

end
