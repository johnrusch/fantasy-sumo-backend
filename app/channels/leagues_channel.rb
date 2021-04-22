class LeaguesChannel < ApplicationCable::Channel
  # periodically every: 1.second do
  #   transmit payload: @t.total_time
  # end

    def subscribed
      @league = League.find_by(id: params[:leagueID])
      stream_for @league
    end

    def received(data)
      LeaguesChannel.broadcast_to(@league)
    end

    def appear
      LeaguesChannel.broadcast_to(@league, {
        message: `#{@current_user} has joined the draft`
      })
    end
  
    def unsubscribed
      # Any cleanup needed when channel is unsubscribed
    end
  end