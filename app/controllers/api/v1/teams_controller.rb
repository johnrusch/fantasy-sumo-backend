class Api::V1::TeamsController < ApplicationController

    def index
        teams = Team.all
        render json: teams
    end

    def update
        team = Team.all.find { |team| team.id == team_params[:teamID] }
        wrestler = Wrestler.all.find { |wrestler| wrestler.id == team_params[:wrestlerID] }
        team.wrestlers << wrestler
        if team.save
            render json: {
                wrestlerID: team_params[:wrestlerID],
                drafted: true
            }, status: 200
        else
           render json: {
               error: "Unable to add wrestler to team"
           }, status: 409
        end
    end

    private
    def team_params
        params.permit(:teamID, :wrestlerID)
    end
    
end
