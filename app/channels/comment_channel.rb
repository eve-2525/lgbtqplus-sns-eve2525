class CommentChannel < ApplicationCable::Channel
  def subscribed
    @worry = Worry.find(params[:worry_id])
    stream_for @worry 
    # stream_from "comment_channel"
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
