defmodule  PhxAppWeb.GraphiQL.Types.InterestTypes do

  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: PhxApp.Repo

  object :category_list do
  	field :category_name,:string
  end


	object :category_master_list do
    	field :category_id, :integer
    	field :interest_name, :string
 #   field :users, list_of(:user_details), resolve: assoc(:user)
  end

  object :category_interest_master_list do
  		field :id, :id
    	field :category_id, :integer
    	field :interest_name, :string
 #   field :users, list_of(:user_details), resolve: assoc(:user)
  end



end