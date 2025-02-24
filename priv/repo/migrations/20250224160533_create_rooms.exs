defmodule ChatApp.Repo.Migrations.CreateRooms do
  use Ecto.Migration

  def change do
    create table(:rooms) do
      add :room, :string
      add :name, :string
      add :visibility, :boolean, default: false, null: false
      add :creator_name, :string
      add :category, references(:room_categories, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:rooms, [:category])
  end
end
