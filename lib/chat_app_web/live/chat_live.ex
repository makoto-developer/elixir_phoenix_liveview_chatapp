defmodule ChatAppWeb.ChatLive do
  use ChatAppWeb, :live_view

  alias ChatServer
  alias Phoenix.PubSub

  @pubsub_topic "chat:lobby"

  def mount(params, _session, socket) do
    room_name = Map.get(params, "name") || "lobby"
    user_list = ["Oliver", "Isabella", "Harper"]

    messages = ChatServer.get_messages(ChatServer, room_name)
    current_user_id = "Oliver"

    # PubSub購読（LiveViewが接続された時のみ）
    if connected?(socket) do
      PubSub.subscribe(ChatApp.PubSub, @pubsub_topic)
    end

    {:ok,
      socket
      |> assign(:current_user_id, current_user_id)
      |> assign(:room_name, room_name)
      |> assign(:user_list, user_list)
      |> assign(:messages, messages)
      |> assign(:new_message, "")}
  end

  # メッセージ送信
  def handle_event("send_message", %{"message" => message}, socket) do
    if message != "" do
      ChatServer.send_message(ChatServer, socket.assigns.room_name, socket.assigns.current_user_id, message)
      {:noreply, socket |> assign(:new_message, "")}
    else
      {:noreply, socket}
    end
  end

  # PubSub 経由で新しいメッセージを受信
  def handle_info({:new_message, room_id, user_id, content}, socket) do
    new_message = %{"user_id" => user_id, "content" => content}

    {:noreply, assign(socket, :messages, socket.assigns.messages ++ [new_message])}
  end
end
