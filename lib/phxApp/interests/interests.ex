defmodule PhxApp.Interests do
  @moduledoc """
  The Interests context.
  """

  import Ecto.Query, warn: false
  alias PhxApp.Repo

  alias PhxApp.Interests.Category
 alias PhxApp.Interests.Category_Master

  @doc """
  Returns the list of categories.

  ## Examples

      iex> list_categories()
      [%Category{}, ...]

  """
def ps_create_category(attrs \\ %{}) do

         %Category{}
        |> Category.changeset(attrs)
        |> Repo.insert()

  end

  def ps_create_category_master(attrs \\ %{}) do

         %Category_Master{}
        |> Category_Master.changeset(attrs)
        |> Repo.insert()

  end

  def list_categories do
    Repo.all(Category)
  end

  def list_categories_interest_master do
    Repo.all(Category_Master)
  end

  def list_category_master_id(arg) do
    id = arg.id
    Repo.get(Category_Master, id)
  end

  @doc """
  Gets a single category.

  Raises `Ecto.NoResultsError` if the Category does not exist.

  ## Examples

      iex> get_category!(123)
      %Category{}

      iex> get_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_category!(id), do: Repo.get!(Category, id)

  @doc """
  Creates a category.

  ## Examples

      iex> create_category(%{field: value})
      {:ok, %Category{}}

      iex> create_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a category.

  ## Examples

      iex> update_category(category, %{field: new_value})
      {:ok, %Category{}}

      iex> update_category(category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Category.

  ## Examples

      iex> delete_category(category)
      {:ok, %Category{}}

      iex> delete_category(category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking category changes.

  ## Examples

      iex> change_category(category)
      %Ecto.Changeset{source: %Category{}}

  """
  def change_category(%Category{} = category) do
    Category.changeset(category, %{})
  end

  alias PhxApp.Interests.Category_Master

  @doc """
  Returns the list of categories_master.

  ## Examples

      iex> list_categories_master()
      [%Category_Master{}, ...]

  """
  def list_categories_master do
    Repo.all(Category_Master)
  end

  @doc """
  Gets a single category__master.

  Raises `Ecto.NoResultsError` if the Category  master does not exist.

  ## Examples

      iex> get_category__master!(123)
      %Category_Master{}

      iex> get_category__master!(456)
      ** (Ecto.NoResultsError)

  """
  def get_category__master!(id), do: Repo.get!(Category_Master, id)

  @doc """
  Creates a category__master.

  ## Examples

      iex> create_category__master(%{field: value})
      {:ok, %Category_Master{}}

      iex> create_category__master(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_category__master(attrs \\ %{}) do
    %Category_Master{}
    |> Category_Master.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a category__master.

  ## Examples

      iex> update_category__master(category__master, %{field: new_value})
      {:ok, %Category_Master{}}

      iex> update_category__master(category__master, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_category__master(%Category_Master{} = category__master, attrs) do
    category__master
    |> Category_Master.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Category_Master.

  ## Examples

      iex> delete_category__master(category__master)
      {:ok, %Category_Master{}}

      iex> delete_category__master(category__master)
      {:error, %Ecto.Changeset{}}

  """
  def delete_category__master(%Category_Master{} = category__master) do
    Repo.delete(category__master)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking category__master changes.

  ## Examples

      iex> change_category__master(category__master)
      %Ecto.Changeset{source: %Category_Master{}}

  """
  def change_category__master(%Category_Master{} = category__master) do
    Category_Master.changeset(category__master, %{})
  end
end
