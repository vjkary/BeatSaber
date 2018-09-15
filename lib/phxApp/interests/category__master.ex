defmodule PhxApp.Interests.Category_Master do
  use Ecto.Schema
  import Ecto.Changeset


  schema "categories_master" do
    field :category_id, :integer
    field :interest_name, :string

    timestamps()
  end

  @doc false
  def changeset(category__master, attrs) do
    category__master
    |> cast(attrs, [:category_id, :interest_name])
    |> validate_required([:category_id, :interest_name])
  end
end
