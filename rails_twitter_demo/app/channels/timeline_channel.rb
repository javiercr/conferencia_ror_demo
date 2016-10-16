# /app/channels/timeline_channel.rb

# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class TimelineChannel < ApplicationCable::Channel
  def subscribed
    @nickname = params[:nickname]
    stream_from "timeline"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def new_msg(payload)
    # Careful with creating the record here
    # http://www.akitaonrails.com/2015/12/28/fixing-dhh-s-rails-5-chat-demo
    message = Message.create!(content: payload['content'], author: @nickname)

    # DHH suggest doing this in a background job instead
    ActionCable.server.broadcast 'timeline', message: message
  end
end
