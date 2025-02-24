defmodule ChatApp.Repo.Migrations.CreateRooms do
  use Ecto.Migration

  def change do
    create table(:rooms) do
      add :name, :string
      add :category, :string
      add :type, :string
      add :visibility, :string
      add :creator_name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
