class Api::V1::LeaguesController < ApplicationController

    def index
        leagues = current_user.leagues
        render json: leagues
    end

    def create
        @league = League.create(league_params)
        # byebug
        if @league.valid? && @league.authenticate(params[:password])
            # token = issue_token(@league)
            render json: {id: @league.id, name: @league.name}
        else
            render json: { error: 'Failed to create user' }, status: :not_acceptable
        end
    end

    private
    def league_params
        params.permit(:id, :name, :password, :teams)
    end
end
