class CommentChannel < ApplicationCable::Channel
  def subscribed
    @worry = Worry.find(params[:worry_id])
    stream_for @worry 
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
