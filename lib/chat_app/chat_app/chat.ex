defmodule ChatApp.ChatApp.Chat do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :message, :string
    field :body, :string
    field :user_name, :string
    field :room_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(chat, attrs) do
    chat
    |> cast(attrs, [:message, :user_name, :body])
    |> validate_required([:message, :user_name, :body])
  end
end
