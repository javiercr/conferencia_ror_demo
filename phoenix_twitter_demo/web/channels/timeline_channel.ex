# /web/channels/timeline_channel.ex

defmodule TwitterDemo.TimelineChannel do
  use TwitterDemo.Web, :channel
  alias TwitterDemo.Message

  def join("timeline:lobby", payload, socket) do
    # Add authorization logic here as required.
    {:ok, socket}
  end

  def handle_in("new_msg", %{"content" => content,}, socket) do
    changeset = Message.changeset(%Message{}, %{
      content: content,
      author: socket.assigns.nickname
    })

    case Repo.insert(changeset) do
      {:ok, message} ->
        broadcast! socket, "new_msg", %{message: message}
        {:noreply, socket}
      {:error, _changeset} ->
        {:reply, {:error, %{error: "Error saving the message"}}, socket}
    end
  end

  def handle_out("new_msg", payload, socket) do
    push socket, "new_msg", payload
    {:noreply, socket}
  end
end
