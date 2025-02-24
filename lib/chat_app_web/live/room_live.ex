defmodule ChatAppWeb.RoomLive do
  use ChatAppWeb, :live_view

  def mount(_params, _session, socket) do
    room_list = ["初めまして", "おしゃべりルーム", "Elixir大好きルーム"]
    {
      :ok,
      socket
        |> assign(:room_list, room_list)
    }
  end
end