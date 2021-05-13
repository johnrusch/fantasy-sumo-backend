class DraftsChannel < ApplicationCable::Channel
  

  def subscribed
    @timer = Rufus::Scheduler.singleton
    stream_from "drafts_channel"
  end

  def start_timer
    if @timer.every_jobs.length > 0
      @timer.every_jobs.each do |job|
        job.unschedule
      end
    end
    time_remaining = 10
    @timer.every '1s' do |job|
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
