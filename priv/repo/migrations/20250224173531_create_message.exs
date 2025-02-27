defmodule ChatApp.Repo.Migrations.CreateMessage do
  use Ecto.Migration

  def change do
    create table(:message) do
      add :user_name, :string
      add :body, :text
      add :room_id, :integer

      timestamps(type: :utc_datetime)
    end

    create index(:message, [:room_id])
  end
end
