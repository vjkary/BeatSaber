defmodule PhxApp.Repo.Migrations.CreateCategoriesMaster do
  use Ecto.Migration

  def change do
    create table(:categories_master) do
      add :categoryId, :integer
      add :interestName, :string

      timestamps()
    end

  end
end
