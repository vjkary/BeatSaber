defmodule PhxAppWeb.GraphiQL.Resolvers.InterestResolver do

	alias PhxApp.Interests


	def ct_category(_root,args,_info) do
		case Interests.ps_create_category(args) do
      {:ok, category} ->
        {:ok, category}

      _error ->
        {:error, _error}
    end
  end

    def ct_category_master(_root,args,_info) do
      IO.inspect args
    case Interests.ps_create_category_master(args) do
      {:ok, category} ->
        {:ok, category}

      _error ->
        {:error, _error}
    end
		    
		end		

  	 def ct_list_all_interest(_root, args, _info) do
   		 {:ok, Interests.list_categories() }
  	end


    def ct_list_all_category_master(_root, args, _info) do
    {:ok, Interests.list_categories_interest_master() }
  end

  def ct_list_category_master_id_based(_root, args, _info) do
    {:ok, Interests.list_category_master_id(args) }
  end


end