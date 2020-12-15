class Api::V1::LeaguesController < ApplicationController

    def index
        leagues = League.all
        render json: leagues
    end

    def user_leagues
        leagues = current_user.leagues
        render json: leagues
    end

    def open_leagues
        leagues = League.all.select{|l| l.closed == false}
        render json: leagues
    end

    def create
        @league = League.new(league_params)
        if @league.valid?
            current_user.leagues.push(@league)

            @team = Team.new(name: `#{current_user.name}'s #{@league.name} Team`)
            current_user.teams.push(@team)
            @league.teams.push(@team)

            @team.save
            @league.save
            render json: {id: @league.id, name: @league.name, closed: false, creator_id: @league.creator_id, teams: @league.teams}
        else
            render json: { error: 'Failed to create user' }, status: :not_acceptable
        end
    end
    
    def update
        league = League.all.find {|league| league.id == league_params[:leagueID]}
        user = User.all.find {|user| user.id == league_params[:userID]}
        if league && user
            league.users << user
            team = Team.new(name: `#{current_user.name}'s #{@league.name} Team`)
            user.teams << team
            league.teams << team
            team.save
            league.save
            render json: league
        end
    end


    private
    def league_params
        params.permit(:id, :name, :passphrase, :closed, :creator_id, :leagueID, :userID)
    end
end
