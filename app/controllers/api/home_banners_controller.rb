class Api::HomeBannersController < ApplicationController
    skip_before_action :authorized

    def index
        banners = HomeBanner.all
        render json: banners, status: :ok
    end

end
