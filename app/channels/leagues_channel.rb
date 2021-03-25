class LeaguesChannel < ApplicationCable::Channel
    def subscribed
      @league = League.find_by(id: params[:id])
      stream_for @league
    end

    def received(data)
        LeaguesChannel.broadcast_to(@league)
    end
  
    def unsubscribed
      # Any cleanup needed when channel is unsubscribed
    end
  end