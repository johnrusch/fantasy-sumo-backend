class Api::V1::LeaguesController < ApplicationController

    def index
        leagues = League.all
        render json: leagues
    end

    def user_leagues
        leagues = current_user.leagues
        puts leagues
        render json: leagues
    end

    def open_leagues
        leagues = League.all.select{|l| l.closed == false}
        render json: leagues
    end

    def create
        @league = League.create(league_params)
        if @league.valid?
            render json: {id: @league.id, name: @league.name}
        else
            render json: { error: 'Failed to create user' }, status: :not_acceptable
        end
    end

    private
    def league_params
        params.permit(:id, :name, :passphrase, :closed, :creator_id)
    end
end
