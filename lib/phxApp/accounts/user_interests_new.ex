defmodule PhxApp.Accounts.UserInterestsNew do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhxApp.Accounts.UserInterestsNew


  schema "users_interests_new" do
    field :interest_id, :string
   field  :interest_count, :integer
    # field :user_id, :id

       timestamps()

    belongs_to :users, PhxApp.Accounts.User, foreign_key: :user_id 
    
  end

  @doc false
  def changeset(users_interests_new, attrs) do
    users_interests_new
    |> cast(attrs, [:user_id,:interest_id,:interest_count])
    # |> validate_required([:interest_id])
  end
end
