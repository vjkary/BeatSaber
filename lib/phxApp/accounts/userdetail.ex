defmodule PhxApp.Accounts.Userdetail do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhxApp.Accounts.Userdetail


  schema "users_details" do
    field :city, :string
    field :email, :string
 #   field :user_id, :id

    timestamps()

    belongs_to :users, PhxApp.Accounts.User, foreign_key: :user_id 
  end

  @doc false
  def changeset(users_details, attrs) do
    users_details
    |> cast(attrs, [:user_id, :email, :city])
    # |> validate_required([:email, :city])
  end
end
