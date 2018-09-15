defmodule PhxAppWeb.GraphiQL.Schema do
	  use Absinthe.Schema

	  alias PhxAppWeb.GraphiQL.Resolvers.UserResolver
	 alias PhxAppWeb.GraphiQL.Resolvers.InterestResolver

	   import_types PhxAppWeb.GraphiQL.Types.UserTypes
       import_types PhxAppWeb.GraphiQL.Types.InterestTypes

	    import_types Absinthe.Plug.Types


        query do
        field :list_all_users, list_of(:user_details) do
        arg :id, non_null(:id)
     	resolve &UserResolver.ct_list_all_users/3
    	end
   
   	   field :list_all, list_of(:user_details) do
     	resolve &UserResolver.ct_list_all/3
    	end
 		
 		field :list_all_category, list_of(:category_list) do
     	resolve &InterestResolver.ct_list_all_interest/3
    	end

    	field :get_common_interests, list_of(:user_interest_lists) do
	   	 	arg :user_id1, :integer
	   	 	arg :user_id2, :integer
	   	 	resolve &UserResolver.ct_list_common_interests/3
	   	 end

	   	   	field :get_user_interest, list_of(:user_interest_list) do
	   	 	arg :user_id, :id
	   	 	resolve &UserResolver.ct_list_of_users_interests/3
	   	 end

	   	 field :get_interest_master, list_of(:category_interest_master_list) do
	   	 	resolve &InterestResolver.ct_list_all_category_master/3
	   	 end

	   	 	 field :get_interest_master_id_based, list_of(:category_interest_master_list) do
	   	 	 	arg :id,non_null(:id)
	   	 	resolve &InterestResolver.ct_list_category_master_id_based/3
	   	 end

        end



	   	 mutation do
	   	 	
	   	 	  field :create_user_detail, list_of(:user_details) do
	   	 	  	arg :name,  non_null(:string)
	   	 	  	arg :passwd, non_null(:string)
	   	 	  	arg :age, non_null(:integer)

	   	 	  	resolve &UserResolver.ct_create_user_detail/3

	   	 	  end

            field :update_name, list_of(:user_details) do
            	arg :post,     :params_update_user
            	arg :id, non_null(:integer)

            	resolve &UserResolver.ct_update_user_detail/3
            end

             field :create_detail_user, list_of(:detail_users) do
             	arg :user_id, non_null(:id)
	   	 	  	arg :city,  non_null(:string)
	   	 	  	arg :email, non_null(:string)

	   	 	  	resolve &UserResolver.ct_detail_user/3

	   	 	  end

	   	 	  field :create_category, list_of(:category_list) do
	   	 	  	arg :category_name, non_null(:string)

	   	 	  	resolve &InterestResolver.ct_category/3
	   	 	  end


	   	 	    field :create_category_master, list_of(:category_master_list) do
             	arg :category_id, non_null(:integer)
	   	 	  	arg :interest_name,  non_null(:string)
	   	 	  	resolve &InterestResolver.ct_category_master/3

	   	 	  end

	   	 	   field :create_user_interest, list_of(:user_interest_list) do
             	arg :user_id, non_null(:id)
	   	 	  	arg :interest_id,  non_null(:string)
	   	 	  	resolve &UserResolver.ct_create_user_interest/3

	   	 	  end



	   end
	end
