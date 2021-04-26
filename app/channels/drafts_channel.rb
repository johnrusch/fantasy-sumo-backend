class DraftsChannel < ApplicationCable::Channel
  

  def subscribed
    @league = League.find_by(id: params[:id])
    stream_for @league
  end

  def start_timer
    periodically every: 1.second do
      transmit payload: "ding from drafts"
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
