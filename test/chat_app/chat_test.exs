defmodule ChatApp.ChatTest do
  use ChatApp.DataCase

  alias ChatApp.Chat

  describe "category" do
    alias ChatApp.Chat.RoomCategories

    import ChatApp.ChatFixtures

    @invalid_attrs %{name: nil}

    test "list_category/0 returns all category" do
      room_categories = room_categories_fixture()
      assert Chat.list_category() == [room_categories]
    end

    test "get_room_categories!/1 returns the room_categories with given id" do
      room_categories = room_categories_fixture()
      assert Chat.get_room_categories!(room_categories.id) == room_categories
    end

    test "create_room_categories/1 with valid data creates a room_categories" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %RoomCategories{} = room_categories} = Chat.create_room_categories(valid_attrs)
      assert room_categories.name == "some name"
    end

    test "create_room_categories/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Chat.create_room_categories(@invalid_attrs)
    end

    test "update_room_categories/2 with valid data updates the room_categories" do
      room_categories = room_categories_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %RoomCategories{} = room_categories} = Chat.update_room_categories(room_categories, update_attrs)
      assert room_categories.name == "some updated name"
    end

    test "update_room_categories/2 with invalid data returns error changeset" do
      room_categories = room_categories_fixture()
      assert {:error, %Ecto.Changeset{}} = Chat.update_room_categories(room_categories, @invalid_attrs)
      assert room_categories == Chat.get_room_categories!(room_categories.id)
    end

    test "delete_room_categories/1 deletes the room_categories" do
      room_categories = room_categories_fixture()
      assert {:ok, %RoomCategories{}} = Chat.delete_room_categories(room_categories)
      assert_raise Ecto.NoResultsError, fn -> Chat.get_room_categories!(room_categories.id) end
    end

    test "change_room_categories/1 returns a room_categories changeset" do
      room_categories = room_categories_fixture()
      assert %Ecto.Changeset{} = Chat.change_room_categories(room_categories)
    end
  end

  describe "user" do
    alias ChatApp.Chat.Users

    import ChatApp.ChatFixtures

    @invalid_attrs %{name: nil, email: nil, ip_address: nil}

    test "list_user/0 returns all user" do
      users = users_fixture()
      assert Chat.list_user() == [users]
    end

    test "get_users!/1 returns the users with given id" do
      users = users_fixture()
      assert Chat.get_users!(users.id) == users
    end

    test "create_users/1 with valid data creates a users" do
      valid_attrs = %{name: "some name", email: "some email", ip_address: "some ip_address"}

      assert {:ok, %Users{} = users} = Chat.create_users(valid_attrs)
      assert users.name == "some name"
      assert users.email == "some email"
      assert users.ip_address == "some ip_address"
    end

    test "create_users/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Chat.create_users(@invalid_attrs)
    end

    test "update_users/2 with valid data updates the users" do
      users = users_fixture()
      update_attrs = %{name: "some updated name", email: "some updated email", ip_address: "some updated ip_address"}

      assert {:ok, %Users{} = users} = Chat.update_users(users, update_attrs)
      assert users.name == "some updated name"
      assert users.email == "some updated email"
      assert users.ip_address == "some updated ip_address"
    end

    test "update_users/2 with invalid data returns error changeset" do
      users = users_fixture()
      assert {:error, %Ecto.Changeset{}} = Chat.update_users(users, @invalid_attrs)
      assert users == Chat.get_users!(users.id)
    end

    test "delete_users/1 deletes the users" do
      users = users_fixture()
      assert {:ok, %Users{}} = Chat.delete_users(users)
      assert_raise Ecto.NoResultsError, fn -> Chat.get_users!(users.id) end
    end

    test "change_users/1 returns a users changeset" do
      users = users_fixture()
      assert %Ecto.Changeset{} = Chat.change_users(users)
    end
  end

  describe "room" do
    alias ChatApp.Chat.Rooms

    import ChatApp.ChatFixtures

    @invalid_attrs %{name: nil, visibility: nil, creator_name: nil}

    test "list_room/0 returns all room" do
      rooms = rooms_fixture()
      assert Chat.list_room() == [rooms]
    end

    test "get_rooms!/1 returns the rooms with given id" do
      rooms = rooms_fixture()
      assert Chat.get_rooms!(rooms.id) == rooms
    end

    test "create_rooms/1 with valid data creates a rooms" do
      valid_attrs = %{name: "some name", visibility: true, creator_name: "some creator_name"}

      assert {:ok, %Rooms{} = rooms} = Chat.create_rooms(valid_attrs)
      assert rooms.name == "some name"
      assert rooms.visibility == true
      assert rooms.creator_name == "some creator_name"
    end

    test "create_rooms/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Chat.create_rooms(@invalid_attrs)
    end

    test "update_rooms/2 with valid data updates the rooms" do
      rooms = rooms_fixture()
      update_attrs = %{name: "some updated name", visibility: false, creator_name: "some updated creator_name"}

      assert {:ok, %Rooms{} = rooms} = Chat.update_rooms(rooms, update_attrs)
      assert rooms.name == "some updated name"
      assert rooms.visibility == false
      assert rooms.creator_name == "some updated creator_name"
    end

    test "update_rooms/2 with invalid data returns error changeset" do
      rooms = rooms_fixture()
      assert {:error, %Ecto.Changeset{}} = Chat.update_rooms(rooms, @invalid_attrs)
      assert rooms == Chat.get_rooms!(rooms.id)
    end

    test "delete_rooms/1 deletes the rooms" do
      rooms = rooms_fixture()
      assert {:ok, %Rooms{}} = Chat.delete_rooms(rooms)
      assert_raise Ecto.NoResultsError, fn -> Chat.get_rooms!(rooms.id) end
    end

    test "change_rooms/1 returns a rooms changeset" do
      rooms = rooms_fixture()
      assert %Ecto.Changeset{} = Chat.change_rooms(rooms)
    end
  end

  describe "message" do
    alias ChatApp.Chat.Messages

    import ChatApp.ChatFixtures

    @invalid_attrs %{body: nil, user_name: nil}

    test "list_message/0 returns all message" do
      messages = messages_fixture()
      assert Chat.list_message() == [messages]
    end

    test "get_messages!/1 returns the messages with given id" do
      messages = messages_fixture()
      assert Chat.get_messages!(messages.id) == messages
    end

    test "create_messages/1 with valid data creates a messages" do
      valid_attrs = %{body: "some body", user_name: "some user_name"}

      assert {:ok, %Messages{} = messages} = Chat.create_messages(valid_attrs)
      assert messages.body == "some body"
      assert messages.user_name == "some user_name"
    end

    test "create_messages/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Chat.create_messages(@invalid_attrs)
    end

    test "update_messages/2 with valid data updates the messages" do
      messages = messages_fixture()
      update_attrs = %{body: "some updated body", user_name: "some updated user_name"}

      assert {:ok, %Messages{} = messages} = Chat.update_messages(messages, update_attrs)
      assert messages.body == "some updated body"
      assert messages.user_name == "some updated user_name"
    end

    test "update_messages/2 with invalid data returns error changeset" do
      messages = messages_fixture()
      assert {:error, %Ecto.Changeset{}} = Chat.update_messages(messages, @invalid_attrs)
      assert messages == Chat.get_messages!(messages.id)
    end

    test "delete_messages/1 deletes the messages" do
      messages = messages_fixture()
      assert {:ok, %Messages{}} = Chat.delete_messages(messages)
      assert_raise Ecto.NoResultsError, fn -> Chat.get_messages!(messages.id) end
    end

    test "change_messages/1 returns a messages changeset" do
      messages = messages_fixture()
      assert %Ecto.Changeset{} = Chat.change_messages(messages)
    end
  end
end
