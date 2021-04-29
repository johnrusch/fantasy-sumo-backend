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
        return render json: { error: 'Failed to create user' }, status: :not_acceptable unless @league.valid?
        current_user.leagues.push(@league)
        @team = Team.new(name: `#{current_user.name}'s #{@league.name} Team`)
        current_user.teams.push(@team)
        @league.teams.push(@team)
        @team.save
        @league.save
        render json: {id: @league.id, name: @league.name, closed: false, creator_id: @league.creator_id, teams: @league.teams}
    end

    def update
        league = League.all.find {|league| league.id == league_params[:leagueID]}
        user = User.all.find {|user| user.id == league_params[:userID]}
        return render json: { error: 'Failed to add user to league', league: league, user: user }, status: :not_acceptable unless league && user 
        if league.users.exists?(user.id)
            render json: {
                message: "User already in league",
                status: 200
            }, status: 200
        else
            league.users << user
            team = Team.new(name: `#{user.name}'s #{league.name} Team`)
            user.teams << team
            team.save
            league.teams << team
            league.save
            user.save
            render json: league
        end
    end

    def start_draft
        league = League.all.find {|league| league.id == league_params[:leagueID]}
        if league
            shuffled_teams = league.teams.map do |team|
                {
                    id: team.id,
                    name: team.name,
                    points: team.points,
                    user: team.user
                }
            end.shuffle
            LeaguesChannel.broadcast_to(league, {
                shuffledTeams: shuffled_teams,
                currentDrafter: shuffled_teams[0]
            })
            render json: {
                draftStarted: true
            }, :status => 200
        else
            render json: { 
                error: "League not found",
                draftStarted: false
             }, :status => 404
        end
    end

    private
    def league_params
        params.permit(:id, :name, :passphrase, :closed, :creator_id, :leagueID, :userID)
    end
end
