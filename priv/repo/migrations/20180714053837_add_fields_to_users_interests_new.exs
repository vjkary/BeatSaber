defmodule PhxApp.Repo.Migrations.AddFieldsToUsersInterestsNew do
  use Ecto.Migration

  def change do
    alter table(:users_interests_new) do
      add :interest_count, :integer
   
  end
  end
end
