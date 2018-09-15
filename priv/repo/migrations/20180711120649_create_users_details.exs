defmodule PhxApp.Repo.Migrations.CreateUsersDetails do
  use Ecto.Migration

  def change do
    create table(:users_details) do
      add :email, :string
      add :city, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:users_details, [:user_id])
  end
end
