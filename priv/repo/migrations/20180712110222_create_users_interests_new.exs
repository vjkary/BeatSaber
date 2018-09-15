defmodule PhxApp.Repo.Migrations.CreateUsersInterestsNew do
  use Ecto.Migration

  def change do
    create table(:users_interests_new) do
      add :interest_id, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:users_interests_new, [:user_id])
  end
end
