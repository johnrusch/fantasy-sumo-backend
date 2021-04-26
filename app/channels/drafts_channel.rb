class DraftsChannel < ApplicationCable::Channel
  

  def subscribed
    @league = League.find_by(id: params[:id])
    stream_for @league
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
    # Any cleanup needed when channel is unsubscribed
  end
end
