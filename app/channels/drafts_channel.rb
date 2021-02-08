class DraftsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    @draft = Draft.find_by(id: params[:draft])
    stream_for @draft
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
