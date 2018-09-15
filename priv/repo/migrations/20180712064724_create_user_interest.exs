defmodule PhxApp.Repo.Migrations.CreateUserInterest do
  use Ecto.Migration

  def change do
    create table(:user_interest) do
      add :interest_id, references(:categories_master, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:user_interest, [:interest_id])
    create index(:user_interest, [:user_id])
  end
end
