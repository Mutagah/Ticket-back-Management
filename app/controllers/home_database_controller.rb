class HomeDatabaseController < ApplicationController
    skip_before_action :authorized

    def index
        render json: 
        %{
            Welcome to Events Bomboclat api.
            Here is a list of all the endpoints:

            GET
            /api/events
            /api/categories
            /api/communities
            /api/home_banners
            /api/login_slides
            /api/tickets
            /api/user_attendeds
            /api/user_profiles
            /api/users

            PATCH
            /api/events/:id
            /api/user_profiles/:id

            DELETE
            /api/user_profiles/:id
            /api/users/:id
            /api/events/:id
        }
    end

end