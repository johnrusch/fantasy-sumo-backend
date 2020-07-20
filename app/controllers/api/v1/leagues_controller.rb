class Api::V1::LeaguesController < ApplicationController

    def index
        leagues = current_user.leagues
        render json: leagues
    end
end
