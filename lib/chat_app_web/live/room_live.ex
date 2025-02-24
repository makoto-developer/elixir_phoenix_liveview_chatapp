defmodule ChatAppWeb.RoomLive do
  use ChatAppWeb, :live_view

  def mount(_params, _session, socket) do
    room_name = "test"
    {
      :ok,
      socket
        |> assign(:room_name, room_name)
        |> assign(:counter, 0)
    }
  end

  def handle_event("increase_counter", _params, socket) do
    {:noreply, update(socket, :counter, &(&1 + 1))}
  end
  def handle_event("decrease_counter", _params, socket) do
    {:noreply, update(socket, :counter, &(&1 - 1))}
  end
end