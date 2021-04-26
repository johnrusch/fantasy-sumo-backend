class LeaguesChannel < ApplicationCable::Channel
  # periodically every: 1.second do
  #   transmit payload: @t.total_time
  # end

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
        status: "online"
      })
    end

    def start_timer
      time_remaining = 200
      while (time_remaining >= 0) 
        LeaguesChannel.broadcast_to(@league, {
          time_remaining: time_remaining - 1
        })
        time_remaining = time_remaining - 1
        sleep(1)
      end
    end
    
    def unsubscribed
      LeaguesChannel.broadcast_to(@league, {
        user_id: @user.id,
        status: "offline"
      })
      
    end
  end