class DraftsChannel < ApplicationCable::Channel
  

  def subscribed
    @timer = Rufus::Scheduler.singleton
    stream_from "drafts_channel"
  end

  def start_timer
    @timer.stop
    time_remaining = 10
    @timer.every '1s' do |job|
          # DraftsChannel.broadcast_to(@league, {
          #   draftClock: Time.at(time_remaining).utc.strftime("%M:%S")
          # })
      ActionCable.server.broadcast "drafts_channel", draftClock: Time.at(time_remaining).utc.strftime("%M:%S")
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
