defmodule PhxApp.Interests.Category do
  use Ecto.Schema
  import Ecto.Changeset


  schema "categories" do
    field :category_id, :integer
    field :category_name, :string

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:category_id, :category_name])
    # |> validate_required([:categoryName, :categoryId])
  end
end
