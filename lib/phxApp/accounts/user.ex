defmodule PhxApp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhxApp.Accounts.User 


  schema "users" do
    field :age, :integer
    field :name, :string
    field :passwd, :string

    has_many :users_details, PhxApp.Accounts.Userdetail 
    has_one :users_interests_new, PhxApp.Accounts.UserInterestsNew
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :age, :passwd])
#    |> validate_required([:name, :age, :passwd])
  end
end
