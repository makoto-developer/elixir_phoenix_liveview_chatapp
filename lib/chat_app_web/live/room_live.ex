defmodule ChatAppWeb.RoomLive do
  use ChatAppWeb, :live_view

  alias ChatApp.Chat
  alias ChatApp.Chat.Rooms

  def mount(_params, _session, socket) do
    room_list = ChatApp.Chat.list_room() |> Enum.map(fn e -> e.name end)
    changeset = Chat.change_rooms(%Rooms{})
    { :ok, socket
      |> assign(:room_list, room_list)
      |> assign(:changeset, changeset)
    }
  end

  def handle_event("create_room", params, socket) do
    name = get_in(params, ["room", "name"])
    room = ChatApp.Chat.get_rooms_by_name!(name)

    category_id = cond do
      [] ->
        ChatApp.Chat.create_rooms(%{
          "name" => name,
          "visibility" => true,
          "creator_name" => "",
          "category" => ""
        })
#        room_list ++ [name]
        name
      true -> room.id
    end
    case Chat.create_rooms(%{
      name: name,
      visibility: true,
      creator_name: "",
      category: category_id
    }) do
      {:ok, room} ->
        # ルーム作成成功時の処理（例：成功メッセージを表示）
        {:noreply, assign(socket, rooms: ChatApp.Repo.all(Rooms))}
      {:error, changeset} ->
        # ルーム作成失敗時の処理（例：エラーメッセージを表示）
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end