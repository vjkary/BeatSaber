defmodule  PhxAppWeb.GraphiQL.Types.UserTypes do

  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: PhxApp.Repo

  object :user_details do
    field :name, :string
    field :passwd, :string
    field :age, :integer
    field :users_details, list_of(:detail_users), resolve: assoc(:users_details)
    field :users_interests_new, list_of(:user_interest_list), resolve: assoc(:users_interests_new)
  end

object :detail_users do
    field :user_id, :id
    field :email, :string
    field :city, :string
 #   field :users, list_of(:user_details), resolve: assoc(:user)
  end


  input_object :params_update_user do
    [(field :name, :string),
    (field :age, :integer),
    (field :passwd, :string)]
  end

  object :user_interest_list do
    field :user_id, :id
    field :interest_id, :string
  end

object :user_interest_lists do
  field :count, :integer
end



 # input_object :user_id_list do
 #    [(field :id, :id)]
 #  end


end