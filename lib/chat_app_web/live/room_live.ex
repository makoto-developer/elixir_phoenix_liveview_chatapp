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
      |> assign(:already_exist, false)
    }
  end

  def handle_event("create_room", params, socket) do
    socket = socket |> assign(:already_exist, false)
    name = get_in(params, ["room", "name"])
    IO.inspect("name")
    IO.inspect(name)
    room = ChatApp.Chat.get_rooms_by_name!(name)
    IO.inspect("room")
    IO.inspect(room)

    # ルーム名が登録されていればスキップ。なければ作成
    cond do
      room == [] ->
        IO.inspect("ok")
#        name
        category_id = 1
        new_room = %{
          name: name,
          visibility: true,
          creator_name: "",
          category: category_id,
        }
        result = Chat.create_rooms(new_room)
        IO.inspect("result")
        IO.inspect(result)
        case result do
          {:ok, _} ->
            IO.inspect("ok1")
            new_rooms = ChatApp.Chat.list_room() |> Enum.map(fn e -> e.name end)
            IO.inspect(new_rooms)
            {:noreply, assign(socket, room_list: new_rooms)}
          {:error, changeset} ->
            IO.inspect("ng1")
            IO.inspect(changeset)
            # ルーム作成失敗時の処理（例：エラーメッセージを表示）
            {:noreply, assign(socket, changeset: changeset)}
        end

      true ->
        IO.inspect("ng")
        elm = List.first(room)
        elm.category
        {:noreply, assign(socket, already_exist: true)}
    end
  end
end