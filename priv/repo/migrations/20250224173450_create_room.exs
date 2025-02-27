defmodule ChatApp.Repo.Migrations.CreateRoom do
  use Ecto.Migration

  def change do
    create table(:room) do
      add :name, :string
      add :visibility, :boolean, default: false, null: false
      add :creator_name, :string
      add :category, :integer

      timestamps(type: :utc_datetime)
    end

    create index(:room, [:category])
  end
end
