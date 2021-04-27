class DraftsChannel < ApplicationCable::Channel
  

  def subscribed
    @league = League.find_by(id: params[:id])
    stream_for @league
  end

  def start_timer
    time_remaining = 7
      timer = Rufus::Scheduler.new
        timer.every '1s' do |job|
          DraftsChannel.broadcast_to(@league, {
            draftClock: Time.at(time_remaining).utc.strftime("%M:%S")
          })  
          time_remaining -= 1
          if time_remaining < 0
            job.unschedule
          end
        end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
