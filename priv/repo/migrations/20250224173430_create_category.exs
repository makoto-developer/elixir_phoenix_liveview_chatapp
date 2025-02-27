defmodule ChatApp.Repo.Migrations.CreateCategory do
  use Ecto.Migration

  def change do
    create table(:category) do
      add :name, :string
      add :parent_id, :integer

      timestamps(type: :utc_datetime)
    end

    create index(:category, [:parent_id])
  end
end
