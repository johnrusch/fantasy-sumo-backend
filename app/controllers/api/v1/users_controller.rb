class Api::V1::UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    def create
        @user = User.create(user_params)
        # byebug
        if @user.valid? && @user.authenticate(params[:password])
            token = issue_token(@user)
            render json: {id: @user.id, name: @user.name, jwt: token}
        else
            render json: { error: 'Failed to create user' }, status: :not_acceptable
        end
    end

    def update
        # byebug
        @user = User.find_by(id: user_params[:id])
        if @user 
            @user.name = user_params[:name]
            @user.password = user_params[:password]
            @user.save
            token = issue_token(@user)
            render json: {id: @user.id, name: @user.name, jwt: token}
        else
            render json: { error: 'Failed to update user' }, status: :not_acceptable
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
