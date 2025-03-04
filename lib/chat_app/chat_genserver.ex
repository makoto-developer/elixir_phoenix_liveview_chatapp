defmodule ChatServer do
  use GenServer
  alias Phoenix.PubSub

  @pubsub_topic "chat:lobby"

  @initial_messages [
    %{"content" => "Hello there, I'm Isabella. nice to meet you.", "user_id" => "Isabella"},
    %{"content" => "Hi Isabella. I'm Oliver. I am a student at the Massachusetts Institute of Technology.", "user_id" => "Oliver"},
    %{"content" => "Hello, I'm Harper. Looking forward to working with you from today.", "user_id" => "Harper"}
  ]

  # Client API

  def get_messages(pid, room_id) do
    GenServer.call(pid, {:get_messages, room_id})
  end

  def send_message(pid, room_id, user_id, message) do
    GenServer.cast(pid, {:send_message, room_id, user_id, message})
  end

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  # Server Callbacks

  def init(:ok) do
    :ets.new(:chat_messages, [:bag, :public, :named_table])

    room_id = "lobby"

    Enum.each(@initial_messages, fn message ->
      timestamp = :os.system_time(:seconds) + :rand.uniform(1000)
      :ets.insert(:chat_messages, {room_id, timestamp, message["user_id"], message["content"]})
    end)

    {:ok, %{}}
  end

  def handle_call({:get_messages, room_id}, _from, state) do
    messages =
      :ets.match_object(:chat_messages, {room_id, :_, :_, :_})
      |> Enum.map(fn {_, _, user_id, content} -> %{"user_id" => user_id, "content" => content} end)

    {:reply, messages, state}
  end

  def handle_cast({:send_message, room_id, user_id, message}, state) do
    timestamp = :os.system_time(:seconds)
    :ets.insert(:chat_messages, {room_id, timestamp, user_id, message})

    # PubSub を使ってメッセージをブロードキャスト
    PubSub.broadcast(ChatApp.PubSub, @pubsub_topic, {:new_message, room_id, user_id, message})

    {:noreply, state}
  end
end
