defmodule ChatApp.Chat.Rooms do
  use Ecto.Schema
  import Ecto.Changeset

  schema "room" do
    field :name, :string
    field :visibility, :boolean, default: false
    field :creator_name, :string
    field :category, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(rooms, attrs) do
    rooms
    |> cast(attrs, [:name, :visibility, :creator_name, :category])
    |> validate_required([:name])
  end
end
