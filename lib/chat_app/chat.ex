defmodule ChatApp.Chat do
  @moduledoc """
  The Chat context.
  """

  import Ecto.Query, warn: false
  alias ChatApp.Repo

  alias ChatApp.Chat.RoomCategories

  @doc """
  Returns the list of category.

  ## Examples

      iex> list_category()
      [%RoomCategories{}, ...]

  """
  def list_category do
    Repo.all(RoomCategories)
  end

  @doc """
  Gets a single room_categories.

  Raises `Ecto.NoResultsError` if the Room categories does not exist.

  ## Examples

      iex> get_room_categories!(123)
      %RoomCategories{}

      iex> get_room_categories!(456)
      ** (Ecto.NoResultsError)

  """
  def get_room_categories_by_name(name) do
    query = from rc in RoomCategories, where: rc.name == ^name
    Repo.all(query)
  end

  @doc """
  Creates a room_categories.

  ## Examples

      iex> create_room_categories(%{field: value})
      {:ok, %RoomCategories{}}

      iex> create_room_categories(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_room_categories(attrs \\ %{}) do
    %RoomCategories{}
    |> RoomCategories.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a room_categories.

  ## Examples

      iex> update_room_categories(room_categories, %{field: new_value})
      {:ok, %RoomCategories{}}

      iex> update_room_categories(room_categories, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_room_categories(%RoomCategories{} = room_categories, attrs) do
    room_categories
    |> RoomCategories.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a room_categories.

  ## Examples

      iex> delete_room_categories(room_categories)
      {:ok, %RoomCategories{}}

      iex> delete_room_categories(room_categories)
      {:error, %Ecto.Changeset{}}

  """
  def delete_room_categories(%RoomCategories{} = room_categories) do
    Repo.delete(room_categories)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking room_categories changes.

  ## Examples

      iex> change_room_categories(room_categories)
      %Ecto.Changeset{data: %RoomCategories{}}

  """
  def change_room_categories(%RoomCategories{} = room_categories, attrs \\ %{}) do
    RoomCategories.changeset(room_categories, attrs)
  end

  alias ChatApp.Chat.Users

  @doc """
  Returns the list of user.

  ## Examples

      iex> list_user()
      [%Users{}, ...]

  """
  def list_user do
    Repo.all(Users)
  end

  @doc """
  Gets a single users.

  Raises `Ecto.NoResultsError` if the Users does not exist.

  ## Examples

      iex> get_users!(123)
      %Users{}

      iex> get_users!(456)
      ** (Ecto.NoResultsError)

  """
  def get_users!(id), do: Repo.get!(Users, id)

  @doc """
  Creates a users.

  ## Examples

      iex> create_users(%{field: value})
      {:ok, %Users{}}

      iex> create_users(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_users(attrs \\ %{}) do
    %Users{}
    |> Users.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a users.

  ## Examples

      iex> update_users(users, %{field: new_value})
      {:ok, %Users{}}

      iex> update_users(users, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_users(%Users{} = users, attrs) do
    users
    |> Users.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a users.

  ## Examples

      iex> delete_users(users)
      {:ok, %Users{}}

      iex> delete_users(users)
      {:error, %Ecto.Changeset{}}

  """
  def delete_users(%Users{} = users) do
    Repo.delete(users)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking users changes.

  ## Examples

      iex> change_users(users)
      %Ecto.Changeset{data: %Users{}}

  """
  def change_users(%Users{} = users, attrs \\ %{}) do
    Users.changeset(users, attrs)
  end

  alias ChatApp.Chat.Rooms

  @doc """
  Returns the list of room.

  ## Examples

      iex> list_room()
      [%Rooms{}, ...]

  """
  def list_room do
    Repo.all(Rooms)
  end

  @doc """
  Gets a single rooms.

  Raises `Ecto.NoResultsError` if the Rooms does not exist.

  ## Examples

      iex> get_rooms!(123)
      %Rooms{}

      iex> get_rooms!(456)
      ** (Ecto.NoResultsError)

  """
  def get_rooms!(id), do: Repo.get!(Rooms, id)
  def get_rooms_by_name!(name) do
    query = from r in Rooms, where: r.name == ^name
    Repo.all(query)
  end

  @doc """
  Creates a rooms.

  ## Examples

      iex> create_rooms(%{field: value})
      {:ok, %Rooms{}}

      iex> create_rooms(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_rooms(attrs \\ %{}) do
    %Rooms{}
    |> Rooms.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a rooms.

  ## Examples

      iex> update_rooms(rooms, %{field: new_value})
      {:ok, %Rooms{}}

      iex> update_rooms(rooms, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_rooms(%Rooms{} = rooms, attrs) do
    rooms
    |> Rooms.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a rooms.

  ## Examples

      iex> delete_rooms(rooms)
      {:ok, %Rooms{}}

      iex> delete_rooms(rooms)
      {:error, %Ecto.Changeset{}}

  """
  def delete_rooms(%Rooms{} = rooms) do
    Repo.delete(rooms)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking rooms changes.

  ## Examples

      iex> change_rooms(rooms)
      %Ecto.Changeset{data: %Rooms{}}

  """
  def change_rooms(%Rooms{} = rooms, attrs \\ %{}) do
    Rooms.changeset(rooms, attrs)
  end

  alias ChatApp.Chat.Messages

  @doc """
  Returns the list of message.

  ## Examples

      iex> list_message()
      [%Messages{}, ...]

  """
  def list_message do
    Repo.all(Messages)
  end

  @doc """
  Gets a single messages.

  Raises `Ecto.NoResultsError` if the Messages does not exist.

  ## Examples

      iex> get_messages!(123)
      %Messages{}

      iex> get_messages!(456)
      ** (Ecto.NoResultsError)

  """
  def get_messages!(id), do: Repo.get!(Messages, id)

  @doc """
  Creates a messages.

  ## Examples

      iex> create_messages(%{field: value})
      {:ok, %Messages{}}

      iex> create_messages(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_messages(attrs \\ %{}) do
    %Messages{}
    |> Messages.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a messages.

  ## Examples

      iex> update_messages(messages, %{field: new_value})
      {:ok, %Messages{}}

      iex> update_messages(messages, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_messages(%Messages{} = messages, attrs) do
    messages
    |> Messages.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a messages.

  ## Examples

      iex> delete_messages(messages)
      {:ok, %Messages{}}

      iex> delete_messages(messages)
      {:error, %Ecto.Changeset{}}

  """
  def delete_messages(%Messages{} = messages) do
    Repo.delete(messages)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking messages changes.

  ## Examples

      iex> change_messages(messages)
      %Ecto.Changeset{data: %Messages{}}

  """
  def change_messages(%Messages{} = messages, attrs \\ %{}) do
    Messages.changeset(messages, attrs)
  end
end
