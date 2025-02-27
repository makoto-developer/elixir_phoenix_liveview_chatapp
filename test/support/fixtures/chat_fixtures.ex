defmodule ChatApp.ChatFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ChatApp.Chat` context.
  """

  @doc """
  Generate a room_categories.
  """
  def room_categories_fixture(attrs \\ %{}) do
    {:ok, room_categories} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> ChatApp.Chat.create_room_categories()

    room_categories
  end

  @doc """
  Generate a users.
  """
  def users_fixture(attrs \\ %{}) do
    {:ok, users} =
      attrs
      |> Enum.into(%{
        email: "some email",
        ip_address: "some ip_address",
        name: "some name"
      })
      |> ChatApp.Chat.create_users()

    users
  end

  @doc """
  Generate a rooms.
  """
  def rooms_fixture(attrs \\ %{}) do
    {:ok, rooms} =
      attrs
      |> Enum.into(%{
        creator_name: "some creator_name",
        name: "some name",
        visibility: true
      })
      |> ChatApp.Chat.create_rooms()

    rooms
  end

  @doc """
  Generate a messages.
  """
  def messages_fixture(attrs \\ %{}) do
    {:ok, messages} =
      attrs
      |> Enum.into(%{
        body: "some body",
        user_name: "some user_name"
      })
      |> ChatApp.Chat.create_messages()

    messages
  end
end
