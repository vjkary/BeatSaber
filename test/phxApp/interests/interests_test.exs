defmodule PhxApp.InterestsTest do
  use PhxApp.DataCase

  alias PhxApp.Interests

  describe "categories" do
    alias PhxApp.Interests.Category

    @valid_attrs %{categoryId: 42, categoryName: "some categoryName"}
    @update_attrs %{categoryId: 43, categoryName: "some updated categoryName"}
    @invalid_attrs %{categoryId: nil, categoryName: nil}

    def category_fixture(attrs \\ %{}) do
      {:ok, category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Interests.create_category()

      category
    end

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Interests.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Interests.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      assert {:ok, %Category{} = category} = Interests.create_category(@valid_attrs)
      assert category.categoryId == 42
      assert category.categoryName == "some categoryName"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Interests.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      assert {:ok, category} = Interests.update_category(category, @update_attrs)
      assert %Category{} = category
      assert category.categoryId == 43
      assert category.categoryName == "some updated categoryName"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Interests.update_category(category, @invalid_attrs)
      assert category == Interests.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Interests.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Interests.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Interests.change_category(category)
    end
  end

  describe "categories_master" do
    alias PhxApp.Interests.Category_Master

    @valid_attrs %{categoryId: 42, interestName: "some interestName"}
    @update_attrs %{categoryId: 43, interestName: "some updated interestName"}
    @invalid_attrs %{categoryId: nil, interestName: nil}

    def category__master_fixture(attrs \\ %{}) do
      {:ok, category__master} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Interests.create_category__master()

      category__master
    end

    test "list_categories_master/0 returns all categories_master" do
      category__master = category__master_fixture()
      assert Interests.list_categories_master() == [category__master]
    end

    test "get_category__master!/1 returns the category__master with given id" do
      category__master = category__master_fixture()
      assert Interests.get_category__master!(category__master.id) == category__master
    end

    test "create_category__master/1 with valid data creates a category__master" do
      assert {:ok, %Category_Master{} = category__master} = Interests.create_category__master(@valid_attrs)
      assert category__master.categoryId == 42
      assert category__master.interestName == "some interestName"
    end

    test "create_category__master/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Interests.create_category__master(@invalid_attrs)
    end

    test "update_category__master/2 with valid data updates the category__master" do
      category__master = category__master_fixture()
      assert {:ok, category__master} = Interests.update_category__master(category__master, @update_attrs)
      assert %Category_Master{} = category__master
      assert category__master.categoryId == 43
      assert category__master.interestName == "some updated interestName"
    end

    test "update_category__master/2 with invalid data returns error changeset" do
      category__master = category__master_fixture()
      assert {:error, %Ecto.Changeset{}} = Interests.update_category__master(category__master, @invalid_attrs)
      assert category__master == Interests.get_category__master!(category__master.id)
    end

    test "delete_category__master/1 deletes the category__master" do
      category__master = category__master_fixture()
      assert {:ok, %Category_Master{}} = Interests.delete_category__master(category__master)
      assert_raise Ecto.NoResultsError, fn -> Interests.get_category__master!(category__master.id) end
    end

    test "change_category__master/1 returns a category__master changeset" do
      category__master = category__master_fixture()
      assert %Ecto.Changeset{} = Interests.change_category__master(category__master)
    end
  end
end
