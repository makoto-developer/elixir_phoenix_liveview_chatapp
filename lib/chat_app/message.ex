defmodule ChatApp.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :body, :string
    field :user_name, :string
    field :room_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:user_name, :body])
    |> validate_required([:user_name, :body])
  end
end
