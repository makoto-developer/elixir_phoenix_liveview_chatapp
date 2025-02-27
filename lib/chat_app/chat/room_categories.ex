defmodule ChatApp.Chat.RoomCategories do
  use Ecto.Schema
  import Ecto.Changeset

  schema "category" do
    field :name, :string
    field :parent_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(room_categories, attrs) do
    room_categories
    |> cast(attrs, [:name, :parent_id])
    |> validate_required([:name])
  end
end
