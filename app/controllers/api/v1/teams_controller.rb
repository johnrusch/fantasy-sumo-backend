class Api::V1::TeamsController < ApplicationController

    def index
        teams = Team.all
        render json: teams
    end

    def update
        team = Team.all.find { |team| team.id == params.teamID }
        wrestler = Wrestler.all.find { |wrestler| wrestler.id == params.wrestlerID }
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
