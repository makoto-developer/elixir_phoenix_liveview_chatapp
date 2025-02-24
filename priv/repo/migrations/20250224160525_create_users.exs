defmodule ChatApp.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :user, :string
      add :name, :string
      add :email, :string
      add :ip_address, :string

      timestamps(type: :utc_datetime)
    end
  end
end
