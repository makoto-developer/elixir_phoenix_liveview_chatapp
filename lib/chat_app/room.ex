defmodule ChatApp.Room do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rooms" do
    field :name, :string
    field :type, :string
    field :category, :string
    field :visibility, :string
    field :creator_name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(room, attrs) do
    room
    |> cast(attrs, [:name, :category, :type, :visibility, :creator_name])
    |> validate_required([:name, :category, :type, :visibility, :creator_name])
  end
end
