class LeaguesChannel < ApplicationCable::Channel

    def subscribed
      @league = League.find_by(id: params[:leagueID])
      @user = User.find_by(id: params[:userID])
      stream_for @league
    end

    def receive(data)
      LeaguesChannel.broadcast_to(@league, "hello from receive")
    end

    def appear
      LeaguesChannel.broadcast_to(@league, {
        user_id: @user.id,
        status: "online"
      })
    end

    def reappear
      LeaguesChannel.broadcast_to(@league, {
        user_id: @user.id,
        status: "online",
        reappear: true
      })
    end
    
    def unsubscribed
      LeaguesChannel.broadcast_to(@league, {
        user_id: @user.id,
        status: "offline"
      })
    end

  
end