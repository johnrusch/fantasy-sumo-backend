class Api::V1::AuthController < ApplicationController

    def create
        user = User.find_by(name: params[:name])
        # byebug
        if user && user.authenticate(params[:password])
            token = issue_token(user)
            render json: {
                id: user.id,
                name: user.name,
                jwt: token
            }
        else
            render json: {error: "User Not Found"}, status: 401
        end
    end

    def show
        @user = User.find_by(id: user_id)
        if @user && logged_in?
            render json: {
                id: @user.id,
                name: @user.name
            }
        else
            render json: {error: "NUH UH"}, status: 401
        end
    end
end