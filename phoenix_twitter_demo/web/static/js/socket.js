// /web/static/js/socket.js

import {Socket} from "phoenix"

let socket = new Socket("/socket", {
  params: { token: window.userToken,  nickname: window.nickname }
})

socket.connect()

let channel = socket.channel("timeline:lobby", {})
let chatInput = document.querySelector("#chat-input")
let messagesContainer = document.querySelector("#messages")

let renderMessage = (message) => {
  let messageItem = document.createElement("li");
  messageItem.innerText = `[${message.inserted_at}] ${message.author}: ${message.content}`
  messagesContainer.appendChild(messageItem)
}

chatInput.addEventListener("keypress", event => {
  if(event.keyCode === 13){
    channel.push("new_msg", {content: chatInput.value})
    chatInput.value = ""
  }
})

channel.on("new_msg", payload => {
  renderMessage(payload.message)
})

channel.on("message_history", payload => {
  payload.messages.forEach((message) => {
    renderMessage(message)
  })
})

channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })

export default socket
