defmodule ChatApp.Chat.Messages do
  use Ecto.Schema
  import Ecto.Changeset

  schema "message" do
    field :body, :string
    field :user_name, :string
    field :room_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(messages, attrs) do
    messages
    |> cast(attrs, [:user_name, :body, :room_id])
    |> validate_required([:user_name, :body, :room_id])
  end
end
