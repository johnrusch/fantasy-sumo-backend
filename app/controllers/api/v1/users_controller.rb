class Api::V1::UsersController < ApplicationController

    def create
        @user = User.create(user_params)
        if @user.valid? && @user.authenticate(params[:password])
            token = issue_token(@user)
            render json: {id: @user.id, name: @user.name, jwt: token}
        else
            render json: { error: 'Failed to create user' }, status: :not_acceptable
        end
    end

    def destroy
        @user = User.find_by(user_params)
        @user.destroy
    end

    private
    def user_params
        params.permit(:id, :name, :password)
    end
end
