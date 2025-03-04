defmodule ChatAppWeb.ChatLive do
  use ChatAppWeb, :live_view

  alias ChatApp.Chat
  alias ChatApp.Chat.Messages

  def mount(params, _session, socket) do
    IO.inspect("params")
    room_name = Map.get(params, "name")
    IO.inspect(params)
    user_list = ["Oliver", "Isabella", "Harper"]
    messages = [
      %{"content" => "Hello there, I'm Isabella. nice to meet you.", "user_id" => "Isabella"},
      %{"content" => "Hi Isabella. I'm Oliver. I am a student at the Massachusetts Institute of Technology.", "user_id" => "Oliver"},
      %{"content" => "Hello, I'm Harper. Looking forward to working with you from today.", "user_id" => "Harper"},
    ]
    current_user_id = "Oliver"
    { :ok, socket
      |> assign(:current_user_id, current_user_id)
      |> assign(:room_name, room_name)
      |> assign(:user_list, user_list)
      |> assign(:messages, messages)
    }
  end

  def handle_event("create_room", _params, socket) do
    {:noreply,socket}
  end
end