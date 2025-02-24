defmodule ChatApp.Repo.Migrations.CreateRoomCategories do
  use Ecto.Migration

  def change do
    create table(:room_categories) do
      add :category, :string
      add :name, :string
      add :parent_id, references(:room_categories, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:room_categories, [:parent_id])
  end
end
