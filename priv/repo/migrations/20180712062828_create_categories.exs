defmodule PhxApp.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :categoryName, :string
      add :categoryId, :integer

      timestamps()
    end

  end
end
