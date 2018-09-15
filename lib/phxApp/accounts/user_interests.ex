defmodule PhxApp.Accounts.UserInterests do
  use Ecto.Schema
  import Ecto.Changeset


  schema "user_interest" do
    field :interest_id, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(user_interests, attrs) do
    user_interests
    |> cast(attrs, [:interest_id, :user_id])
    # |> validate_required([])
  end
end
