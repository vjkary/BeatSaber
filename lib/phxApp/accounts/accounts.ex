defmodule PhxApp.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
 
  alias PhxApp.Repo
#  alias PhxApp.Accounts
  alias PhxApp.Accounts.User 
  alias PhxApp.Accounts.Userdetail
  alias PhxApp.Accounts.UserInterestsNew

  def ps_create_user_detail(attrs \\ %{}) do

         %User{}
        |> User.changeset(attrs)
        |> Repo.insert()

  end

   def ps_create_user_interest(attrs \\ %{}) do
      user = Repo.get_by(UserInterestsNew, user_id: attrs.user_id)
    IO.inspect user
      case user do

      nil ->
         %UserInterestsNew{}
        |> UserInterestsNew.changeset(attrs)
        |> Repo.insert()
  _ ->
    IO.inspect attrs
        user
        |> UserInterestsNew.changeset(attrs)
        |> Repo.update()
  end
end

  def ps_list_user_interest(attrs \\ %{}) do
     user = Repo.get_by(UserInterestsNew, user_id: attrs.user_id)
   IO.inspect(user)
    
  end

  def ps_list_of_users_interests(args) do
  # end

    #    PhxApp.HelperLibrraries.CountFetcher.countk(
    #   args.user_id1,
    #   args.user_id2
    # )
      q1 = from u in UserInterestsNew, 
       # distinct: u.interest_id,
        where: u.user_id == ^args.user_id1,
        select: u.interest_id

      q2 = from u in UserInterestsNew, 
       # distinct: u.interest_id,
        where: u.user_id == ^args.user_id2,
      select: u.interest_id

    data1 = List.to_string(Repo.all(q1))
    data2 =  List.to_string(Repo.all(q2))
   
    data_list1 = String.split(data1,",")
    data_list2 = String.split(data2,",")
    final_list = MapSet.intersection(MapSet.new(data_list1),MapSet.new(data_list2))
    final_count =MapSet.size(final_list)

  ff= %{:count => final_count}

    # |> Enum.each( &final_count/1 )
    IO.inspect ff
     #  cols = Enum.map final_list, &(String.to_atom(&1))
     # Enum.map final_count, fn(row) -> struct(__MODULE__, Enum.zip(cols, row)) end
     # PhxApp.HelperLibrraries.CountFetcher.countk(
     #  final_count
   #  )
   
  end



  def ps_update_user_detail(%{id: id,  post: post_params}) do
    data = Repo.get_by(User,id: id)
    IO.inspect(data)

     case data do
      nil ->
        {:error, "Data does not exist"}

      data ->
        data
        |> User.changeset(post_params)
        |> Repo.update()
    
  end
   
  end

    def ps_list_all_users(arg) do
       user_id = arg.id
     Repo.get(User, user_id)

  end



    def ps_create_detail_user(attrs \\ %{}) do

         %Userdetail{}
        |> Userdetail.changeset(attrs)
        |> Repo.insert()

  end


  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias PhxApp.Accounts.User

  @doc """
  Returns the list of user_details.

  ## Examples

      iex> list_user_details()
      [%User{}, ...]

  """
  def list_user_details do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  # def create_user(attrs \\ %{}) do
  #   %User{}
  #   |> User.changeset(attrs)
  #   |> Repo.insert()
  # end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias PhxApp.Accounts.Userdetail

  @doc """
  Returns the list of users_details.

  ## Examples

      iex> list_users_details()
      [%Userdetail{}, ...]

  """
  def list_users_details do
    Repo.all(Userdetail)
  end

  @doc """
  Gets a single userdetail.

  Raises `Ecto.NoResultsError` if the Userdetail does not exist.

  ## Examples

      iex> get_userdetail!(123)
      %Userdetail{}

      iex> get_userdetail!(456)
      ** (Ecto.NoResultsError)

  """
  def get_userdetail!(id), do: Repo.get!(Userdetail, id)

  @doc """
  Creates a userdetail.

  ## Examples

      iex> create_userdetail(%{field: value})
      {:ok, %Userdetail{}}

      iex> create_userdetail(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_userdetail(attrs \\ %{}) do
    %Userdetail{}
    |> Userdetail.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a userdetail.

  ## Examples

      iex> update_userdetail(userdetail, %{field: new_value})
      {:ok, %Userdetail{}}

      iex> update_userdetail(userdetail, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_userdetail(%Userdetail{} = userdetail, attrs) do
    userdetail
    |> Userdetail.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Userdetail.

  ## Examples

      iex> delete_userdetail(userdetail)
      {:ok, %Userdetail{}}

      iex> delete_userdetail(userdetail)
      {:error, %Ecto.Changeset{}}

  """
  def delete_userdetail(%Userdetail{} = userdetail) do
    Repo.delete(userdetail)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking userdetail changes.

  ## Examples

      iex> change_userdetail(userdetail)
      %Ecto.Changeset{source: %Userdetail{}}

  """
  def change_userdetail(%Userdetail{} = userdetail) do
    Userdetail.changeset(userdetail, %{})
  end

  alias PhxApp.Accounts.UserInterests

  @doc """
  Returns the list of user_interest.

  ## Examples

      iex> list_user_interest()
      [%UserInterests{}, ...]

  """
  def list_user_interest do
    Repo.all(UserInterests)
  end

  @doc """
  Gets a single user_interests.

  Raises `Ecto.NoResultsError` if the User interests does not exist.

  ## Examples

      iex> get_user_interests!(123)
      %UserInterests{}

      iex> get_user_interests!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_interests!(id), do: Repo.get!(UserInterests, id)

  @doc """
  Creates a user_interests.

  ## Examples

      iex> create_user_interests(%{field: value})
      {:ok, %UserInterests{}}

      iex> create_user_interests(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_interests(attrs \\ %{}) do
    %UserInterests{}
    |> UserInterests.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_interests.

  ## Examples

      iex> update_user_interests(user_interests, %{field: new_value})
      {:ok, %UserInterests{}}

      iex> update_user_interests(user_interests, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_interests(%UserInterests{} = user_interests, attrs) do
    user_interests
    |> UserInterests.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a UserInterests.

  ## Examples

      iex> delete_user_interests(user_interests)
      {:ok, %UserInterests{}}

      iex> delete_user_interests(user_interests)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_interests(%UserInterests{} = user_interests) do
    Repo.delete(user_interests)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_interests changes.

  ## Examples

      iex> change_user_interests(user_interests)
      %Ecto.Changeset{source: %UserInterests{}}

  """
  def change_user_interests(%UserInterests{} = user_interests) do
    UserInterests.changeset(user_interests, %{})
  end



  alias PhxApp.Accounts.UserInterestsNew

  @doc """
  Returns the list of users_interests_new.

  ## Examples

      iex> list_users_interests_new()
      [%UserInterestsNew{}, ...]

  """
  def list_users_interests_new do
    Repo.all(UserInterestsNew)
  end

  @doc """
  Gets a single user_interests_new.

  Raises `Ecto.NoResultsError` if the User interests new does not exist.

  ## Examples

      iex> get_user_interests_new!(123)
      %UserInterestsNew{}

      iex> get_user_interests_new!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_interests_new!(id), do: Repo.get!(UserInterestsNew, id)

  @doc """
  Creates a user_interests_new.

  ## Examples

      iex> create_user_interests_new(%{field: value})
      {:ok, %UserInterestsNew{}}

      iex> create_user_interests_new(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_interests_new(attrs \\ %{}) do
    %UserInterestsNew{}
    |> UserInterestsNew.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_interests_new.

  ## Examples

      iex> update_user_interests_new(user_interests_new, %{field: new_value})
      {:ok, %UserInterestsNew{}}

      iex> update_user_interests_new(user_interests_new, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_interests_new(%UserInterestsNew{} = user_interests_new, attrs) do
    user_interests_new
    |> UserInterestsNew.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a UserInterestsNew.

  ## Examples

      iex> delete_user_interests_new(user_interests_new)
      {:ok, %UserInterestsNew{}}

      iex> delete_user_interests_new(user_interests_new)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_interests_new(%UserInterestsNew{} = user_interests_new) do
    Repo.delete(user_interests_new)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_interests_new changes.

  ## Examples

      iex> change_user_interests_new(user_interests_new)
      %Ecto.Changeset{source: %UserInterestsNew{}}

  """
  def change_user_interests_new(%UserInterestsNew{} = user_interests_new) do
    UserInterestsNew.changeset(user_interests_new, %{})
  end
end
