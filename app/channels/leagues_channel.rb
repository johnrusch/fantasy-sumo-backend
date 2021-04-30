class LeaguesChannel < ApplicationCable::Channel

    def subscribed
      @league = League.find_by(id: params[:leagueID])
      @user = User.find_by(id: params[:userID])
      stream_for @league
    end

    def received(data)
      LeaguesChannel.broadcast_to(@league)
    end

    def appear
      LeaguesChannel.broadcast_to(@league, {
        user_id: @user.id,
        status: "online",
        users: ActionCable.server.connections
      })
    end
    
    def unsubscribed
      LeaguesChannel.broadcast_to(@league, {
        user_id: @user.id,
        status: "offline"
      })
      
    end
end