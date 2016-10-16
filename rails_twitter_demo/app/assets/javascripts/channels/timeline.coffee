# /app/assets/javascripts/channels/timeline.coffee

App.timeline = App.cable.subscriptions.create {channel: "TimelineChannel", nickname: window.nickname},
  connected: ->
    # Called when the subscription is ready for use on the server
    chatInput = document.querySelector("#chat-input")
    chatInput.addEventListener "keypress", (event) =>
      if event.keyCode == 13
        @new_msg chatInput.value
        chatInput.value = ""

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (payload) ->
    @_renderdMessage(payload.message)

  new_msg: (message) ->
    @perform 'new_msg', {content: message}

  _renderdMessage: (message) ->
    messagesContainer = document.querySelector("#messages")
    messageItem = document.createElement("li")
    messageItem.innerText = "[#{message.created_at}] #{message.author}: #{message.content}"
    messagesContainer.appendChild(messageItem)