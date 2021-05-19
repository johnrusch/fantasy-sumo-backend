class Api::V1::TeamsController < ApplicationController

    def index
        teams = Team.all
        render json: teams
    end

    def update
        team = current_user.teams.find { |team| team.id == params.team.id }
        wrestler = Wrestler.all.find { |wrestler| wrestler.id == params.wrestler.id }
        team.wrestlers << wrestler
        if team.save
            render json: {
                wrestlerID: params.wrestler.id,
                drafted: true
            }, status: 200
        else
           render json: {
               error: "Unable to add wrestler to team"
           }, status: 409
        end
    end

    
end
