class Api::UserProfilesController < ApplicationController
    # load_and_authorize_resource

    def show
        @profile = current_user.user_profile
        render json: @profile, status: :ok
    end

    def update
        current_user.user_profile.update!(update_params)
        bring_it = current_user.user_profile
        render json: bring_it, status: :created
    end

    private

    def update_params
        params.permit(:full_name, :age, :gender, :bio, :image_upload, :mobile_no)
    end

end
