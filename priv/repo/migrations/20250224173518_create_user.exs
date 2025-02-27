defmodule ChatApp.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :name, :string
      add :email, :string
      add :ip_address, :string

      timestamps(type: :utc_datetime)
    end
  end
end
