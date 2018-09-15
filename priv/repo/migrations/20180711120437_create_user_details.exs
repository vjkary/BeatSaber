defmodule PhxApp.Repo.Migrations.CreateUserDetails do
  use Ecto.Migration

  def change do
    create table(:user_details) do
      add :email, :string
      add :city, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:user_details, [:user_id])
  end
end
