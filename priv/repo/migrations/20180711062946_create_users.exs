defmodule PhxApp.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :age, :integer
      add :passwd, :string

      timestamps()
    end

  end
end
