defmodule PhxApp.AccountsTest do
  use PhxApp.DataCase

  alias PhxApp.Accounts

  describe "users" do
    alias PhxApp.Accounts.User

    @valid_attrs %{age: 42, name: "some name", passwd: "some passwd"}
    @update_attrs %{age: 43, name: "some updated name", passwd: "some updated passwd"}
    @invalid_attrs %{age: nil, name: nil, passwd: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.age == 42
      assert user.name == "some name"
      assert user.passwd == "some passwd"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Accounts.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.age == 43
      assert user.name == "some updated name"
      assert user.passwd == "some updated passwd"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "user_details" do
    alias PhxApp.Accounts.User

    @valid_attrs %{city: "some city", email: "some email"}
    @update_attrs %{city: "some updated city", email: "some updated email"}
    @invalid_attrs %{city: nil, email: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_user_details/0 returns all user_details" do
      user = user_fixture()
      assert Accounts.list_user_details() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.city == "some city"
      assert user.email == "some email"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Accounts.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.city == "some updated city"
      assert user.email == "some updated email"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "users_details" do
    alias PhxApp.Accounts.Userdetail

    @valid_attrs %{city: "some city", email: "some email"}
    @update_attrs %{city: "some updated city", email: "some updated email"}
    @invalid_attrs %{city: nil, email: nil}

    def userdetail_fixture(attrs \\ %{}) do
      {:ok, userdetail} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_userdetail()

      userdetail
    end

    test "list_users_details/0 returns all users_details" do
      userdetail = userdetail_fixture()
      assert Accounts.list_users_details() == [userdetail]
    end

    test "get_userdetail!/1 returns the userdetail with given id" do
      userdetail = userdetail_fixture()
      assert Accounts.get_userdetail!(userdetail.id) == userdetail
    end

    test "create_userdetail/1 with valid data creates a userdetail" do
      assert {:ok, %Userdetail{} = userdetail} = Accounts.create_userdetail(@valid_attrs)
      assert userdetail.city == "some city"
      assert userdetail.email == "some email"
    end

    test "create_userdetail/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_userdetail(@invalid_attrs)
    end

    test "update_userdetail/2 with valid data updates the userdetail" do
      userdetail = userdetail_fixture()
      assert {:ok, userdetail} = Accounts.update_userdetail(userdetail, @update_attrs)
      assert %Userdetail{} = userdetail
      assert userdetail.city == "some updated city"
      assert userdetail.email == "some updated email"
    end

    test "update_userdetail/2 with invalid data returns error changeset" do
      userdetail = userdetail_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_userdetail(userdetail, @invalid_attrs)
      assert userdetail == Accounts.get_userdetail!(userdetail.id)
    end

    test "delete_userdetail/1 deletes the userdetail" do
      userdetail = userdetail_fixture()
      assert {:ok, %Userdetail{}} = Accounts.delete_userdetail(userdetail)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_userdetail!(userdetail.id) end
    end

    test "change_userdetail/1 returns a userdetail changeset" do
      userdetail = userdetail_fixture()
      assert %Ecto.Changeset{} = Accounts.change_userdetail(userdetail)
    end
  end

  describe "user_interest" do
    alias PhxApp.Accounts.UserInterests

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def user_interests_fixture(attrs \\ %{}) do
      {:ok, user_interests} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user_interests()

      user_interests
    end

    test "list_user_interest/0 returns all user_interest" do
      user_interests = user_interests_fixture()
      assert Accounts.list_user_interest() == [user_interests]
    end

    test "get_user_interests!/1 returns the user_interests with given id" do
      user_interests = user_interests_fixture()
      assert Accounts.get_user_interests!(user_interests.id) == user_interests
    end

    test "create_user_interests/1 with valid data creates a user_interests" do
      assert {:ok, %UserInterests{} = user_interests} = Accounts.create_user_interests(@valid_attrs)
    end

    test "create_user_interests/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user_interests(@invalid_attrs)
    end

    test "update_user_interests/2 with valid data updates the user_interests" do
      user_interests = user_interests_fixture()
      assert {:ok, user_interests} = Accounts.update_user_interests(user_interests, @update_attrs)
      assert %UserInterests{} = user_interests
    end

    test "update_user_interests/2 with invalid data returns error changeset" do
      user_interests = user_interests_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user_interests(user_interests, @invalid_attrs)
      assert user_interests == Accounts.get_user_interests!(user_interests.id)
    end

    test "delete_user_interests/1 deletes the user_interests" do
      user_interests = user_interests_fixture()
      assert {:ok, %UserInterests{}} = Accounts.delete_user_interests(user_interests)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user_interests!(user_interests.id) end
    end

    test "change_user_interests/1 returns a user_interests changeset" do
      user_interests = user_interests_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user_interests(user_interests)
    end
  end

  describe "new_user_interest" do
    alias PhxApp.Accounts.NewUserInterest

    @valid_attrs %{interest_id: "some interest_id"}
    @update_attrs %{interest_id: "some updated interest_id"}
    @invalid_attrs %{interest_id: nil}

    def new_user_interest_fixture(attrs \\ %{}) do
      {:ok, new_user_interest} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_new_user_interest()

      new_user_interest
    end

    test "list_new_user_interest/0 returns all new_user_interest" do
      new_user_interest = new_user_interest_fixture()
      assert Accounts.list_new_user_interest() == [new_user_interest]
    end

    test "get_new_user_interest!/1 returns the new_user_interest with given id" do
      new_user_interest = new_user_interest_fixture()
      assert Accounts.get_new_user_interest!(new_user_interest.id) == new_user_interest
    end

    test "create_new_user_interest/1 with valid data creates a new_user_interest" do
      assert {:ok, %NewUserInterest{} = new_user_interest} = Accounts.create_new_user_interest(@valid_attrs)
      assert new_user_interest.interest_id == "some interest_id"
    end

    test "create_new_user_interest/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_new_user_interest(@invalid_attrs)
    end

    test "update_new_user_interest/2 with valid data updates the new_user_interest" do
      new_user_interest = new_user_interest_fixture()
      assert {:ok, new_user_interest} = Accounts.update_new_user_interest(new_user_interest, @update_attrs)
      assert %NewUserInterest{} = new_user_interest
      assert new_user_interest.interest_id == "some updated interest_id"
    end

    test "update_new_user_interest/2 with invalid data returns error changeset" do
      new_user_interest = new_user_interest_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_new_user_interest(new_user_interest, @invalid_attrs)
      assert new_user_interest == Accounts.get_new_user_interest!(new_user_interest.id)
    end

    test "delete_new_user_interest/1 deletes the new_user_interest" do
      new_user_interest = new_user_interest_fixture()
      assert {:ok, %NewUserInterest{}} = Accounts.delete_new_user_interest(new_user_interest)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_new_user_interest!(new_user_interest.id) end
    end

    test "change_new_user_interest/1 returns a new_user_interest changeset" do
      new_user_interest = new_user_interest_fixture()
      assert %Ecto.Changeset{} = Accounts.change_new_user_interest(new_user_interest)
    end
  end

  describe "new_user_interest1" do
    alias PhxApp.Accounts.NewUserInterest1

    @valid_attrs %{interest_id: "some interest_id"}
    @update_attrs %{interest_id: "some updated interest_id"}
    @invalid_attrs %{interest_id: nil}

    def new_user_interest1_fixture(attrs \\ %{}) do
      {:ok, new_user_interest1} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_new_user_interest1()

      new_user_interest1
    end

    test "list_new_user_interest1/0 returns all new_user_interest1" do
      new_user_interest1 = new_user_interest1_fixture()
      assert Accounts.list_new_user_interest1() == [new_user_interest1]
    end

    test "get_new_user_interest1!/1 returns the new_user_interest1 with given id" do
      new_user_interest1 = new_user_interest1_fixture()
      assert Accounts.get_new_user_interest1!(new_user_interest1.id) == new_user_interest1
    end

    test "create_new_user_interest1/1 with valid data creates a new_user_interest1" do
      assert {:ok, %NewUserInterest1{} = new_user_interest1} = Accounts.create_new_user_interest1(@valid_attrs)
      assert new_user_interest1.interest_id == "some interest_id"
    end

    test "create_new_user_interest1/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_new_user_interest1(@invalid_attrs)
    end

    test "update_new_user_interest1/2 with valid data updates the new_user_interest1" do
      new_user_interest1 = new_user_interest1_fixture()
      assert {:ok, new_user_interest1} = Accounts.update_new_user_interest1(new_user_interest1, @update_attrs)
      assert %NewUserInterest1{} = new_user_interest1
      assert new_user_interest1.interest_id == "some updated interest_id"
    end

    test "update_new_user_interest1/2 with invalid data returns error changeset" do
      new_user_interest1 = new_user_interest1_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_new_user_interest1(new_user_interest1, @invalid_attrs)
      assert new_user_interest1 == Accounts.get_new_user_interest1!(new_user_interest1.id)
    end

    test "delete_new_user_interest1/1 deletes the new_user_interest1" do
      new_user_interest1 = new_user_interest1_fixture()
      assert {:ok, %NewUserInterest1{}} = Accounts.delete_new_user_interest1(new_user_interest1)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_new_user_interest1!(new_user_interest1.id) end
    end

    test "change_new_user_interest1/1 returns a new_user_interest1 changeset" do
      new_user_interest1 = new_user_interest1_fixture()
      assert %Ecto.Changeset{} = Accounts.change_new_user_interest1(new_user_interest1)
    end
  end

  describe "user_interest2" do
    alias PhxApp.Accounts.UserInterest2

    @valid_attrs %{interest_id: "some interest_id"}
    @update_attrs %{interest_id: "some updated interest_id"}
    @invalid_attrs %{interest_id: nil}

    def user_interest2_fixture(attrs \\ %{}) do
      {:ok, user_interest2} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user_interest2()

      user_interest2
    end

    test "list_user_interest2/0 returns all user_interest2" do
      user_interest2 = user_interest2_fixture()
      assert Accounts.list_user_interest2() == [user_interest2]
    end

    test "get_user_interest2!/1 returns the user_interest2 with given id" do
      user_interest2 = user_interest2_fixture()
      assert Accounts.get_user_interest2!(user_interest2.id) == user_interest2
    end

    test "create_user_interest2/1 with valid data creates a user_interest2" do
      assert {:ok, %UserInterest2{} = user_interest2} = Accounts.create_user_interest2(@valid_attrs)
      assert user_interest2.interest_id == "some interest_id"
    end

    test "create_user_interest2/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user_interest2(@invalid_attrs)
    end

    test "update_user_interest2/2 with valid data updates the user_interest2" do
      user_interest2 = user_interest2_fixture()
      assert {:ok, user_interest2} = Accounts.update_user_interest2(user_interest2, @update_attrs)
      assert %UserInterest2{} = user_interest2
      assert user_interest2.interest_id == "some updated interest_id"
    end

    test "update_user_interest2/2 with invalid data returns error changeset" do
      user_interest2 = user_interest2_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user_interest2(user_interest2, @invalid_attrs)
      assert user_interest2 == Accounts.get_user_interest2!(user_interest2.id)
    end

    test "delete_user_interest2/1 deletes the user_interest2" do
      user_interest2 = user_interest2_fixture()
      assert {:ok, %UserInterest2{}} = Accounts.delete_user_interest2(user_interest2)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user_interest2!(user_interest2.id) end
    end

    test "change_user_interest2/1 returns a user_interest2 changeset" do
      user_interest2 = user_interest2_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user_interest2(user_interest2)
    end
  end

  describe "clr_user_interest1" do
    alias PhxApp.Accounts.ClrUserInterest

    @valid_attrs %{interest_id: "some interest_id"}
    @update_attrs %{interest_id: "some updated interest_id"}
    @invalid_attrs %{interest_id: nil}

    def clr_user_interest_fixture(attrs \\ %{}) do
      {:ok, clr_user_interest} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_clr_user_interest()

      clr_user_interest
    end

    test "list_clr_user_interest1/0 returns all clr_user_interest1" do
      clr_user_interest = clr_user_interest_fixture()
      assert Accounts.list_clr_user_interest1() == [clr_user_interest]
    end

    test "get_clr_user_interest!/1 returns the clr_user_interest with given id" do
      clr_user_interest = clr_user_interest_fixture()
      assert Accounts.get_clr_user_interest!(clr_user_interest.id) == clr_user_interest
    end

    test "create_clr_user_interest/1 with valid data creates a clr_user_interest" do
      assert {:ok, %ClrUserInterest{} = clr_user_interest} = Accounts.create_clr_user_interest(@valid_attrs)
      assert clr_user_interest.interest_id == "some interest_id"
    end

    test "create_clr_user_interest/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_clr_user_interest(@invalid_attrs)
    end

    test "update_clr_user_interest/2 with valid data updates the clr_user_interest" do
      clr_user_interest = clr_user_interest_fixture()
      assert {:ok, clr_user_interest} = Accounts.update_clr_user_interest(clr_user_interest, @update_attrs)
      assert %ClrUserInterest{} = clr_user_interest
      assert clr_user_interest.interest_id == "some updated interest_id"
    end

    test "update_clr_user_interest/2 with invalid data returns error changeset" do
      clr_user_interest = clr_user_interest_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_clr_user_interest(clr_user_interest, @invalid_attrs)
      assert clr_user_interest == Accounts.get_clr_user_interest!(clr_user_interest.id)
    end

    test "delete_clr_user_interest/1 deletes the clr_user_interest" do
      clr_user_interest = clr_user_interest_fixture()
      assert {:ok, %ClrUserInterest{}} = Accounts.delete_clr_user_interest(clr_user_interest)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_clr_user_interest!(clr_user_interest.id) end
    end

    test "change_clr_user_interest/1 returns a clr_user_interest changeset" do
      clr_user_interest = clr_user_interest_fixture()
      assert %Ecto.Changeset{} = Accounts.change_clr_user_interest(clr_user_interest)
    end
  end

  describe "user_interestsf" do
    alias PhxApp.Accounts.User_interestsf

    @valid_attrs %{interest_id: "some interest_id"}
    @update_attrs %{interest_id: "some updated interest_id"}
    @invalid_attrs %{interest_id: nil}

    def user_interestsf_fixture(attrs \\ %{}) do
      {:ok, user_interestsf} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user_interestsf()

      user_interestsf
    end

    test "list_user_interestsf/0 returns all user_interestsf" do
      user_interestsf = user_interestsf_fixture()
      assert Accounts.list_user_interestsf() == [user_interestsf]
    end

    test "get_user_interestsf!/1 returns the user_interestsf with given id" do
      user_interestsf = user_interestsf_fixture()
      assert Accounts.get_user_interestsf!(user_interestsf.id) == user_interestsf
    end

    test "create_user_interestsf/1 with valid data creates a user_interestsf" do
      assert {:ok, %User_interestsf{} = user_interestsf} = Accounts.create_user_interestsf(@valid_attrs)
      assert user_interestsf.interest_id == "some interest_id"
    end

    test "create_user_interestsf/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user_interestsf(@invalid_attrs)
    end

    test "update_user_interestsf/2 with valid data updates the user_interestsf" do
      user_interestsf = user_interestsf_fixture()
      assert {:ok, user_interestsf} = Accounts.update_user_interestsf(user_interestsf, @update_attrs)
      assert %User_interestsf{} = user_interestsf
      assert user_interestsf.interest_id == "some updated interest_id"
    end

    test "update_user_interestsf/2 with invalid data returns error changeset" do
      user_interestsf = user_interestsf_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user_interestsf(user_interestsf, @invalid_attrs)
      assert user_interestsf == Accounts.get_user_interestsf!(user_interestsf.id)
    end

    test "delete_user_interestsf/1 deletes the user_interestsf" do
      user_interestsf = user_interestsf_fixture()
      assert {:ok, %User_interestsf{}} = Accounts.delete_user_interestsf(user_interestsf)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user_interestsf!(user_interestsf.id) end
    end

    test "change_user_interestsf/1 returns a user_interestsf changeset" do
      user_interestsf = user_interestsf_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user_interestsf(user_interestsf)
    end
  end

  describe "users_interests_new" do
    alias PhxApp.Accounts.UserInterestsNew

    @valid_attrs %{interest_id: "some interest_id"}
    @update_attrs %{interest_id: "some updated interest_id"}
    @invalid_attrs %{interest_id: nil}

    def user_interests_new_fixture(attrs \\ %{}) do
      {:ok, user_interests_new} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user_interests_new()

      user_interests_new
    end

    test "list_users_interests_new/0 returns all users_interests_new" do
      user_interests_new = user_interests_new_fixture()
      assert Accounts.list_users_interests_new() == [user_interests_new]
    end

    test "get_user_interests_new!/1 returns the user_interests_new with given id" do
      user_interests_new = user_interests_new_fixture()
      assert Accounts.get_user_interests_new!(user_interests_new.id) == user_interests_new
    end

    test "create_user_interests_new/1 with valid data creates a user_interests_new" do
      assert {:ok, %UserInterestsNew{} = user_interests_new} = Accounts.create_user_interests_new(@valid_attrs)
      assert user_interests_new.interest_id == "some interest_id"
    end

    test "create_user_interests_new/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user_interests_new(@invalid_attrs)
    end

    test "update_user_interests_new/2 with valid data updates the user_interests_new" do
      user_interests_new = user_interests_new_fixture()
      assert {:ok, user_interests_new} = Accounts.update_user_interests_new(user_interests_new, @update_attrs)
      assert %UserInterestsNew{} = user_interests_new
      assert user_interests_new.interest_id == "some updated interest_id"
    end

    test "update_user_interests_new/2 with invalid data returns error changeset" do
      user_interests_new = user_interests_new_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user_interests_new(user_interests_new, @invalid_attrs)
      assert user_interests_new == Accounts.get_user_interests_new!(user_interests_new.id)
    end

    test "delete_user_interests_new/1 deletes the user_interests_new" do
      user_interests_new = user_interests_new_fixture()
      assert {:ok, %UserInterestsNew{}} = Accounts.delete_user_interests_new(user_interests_new)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user_interests_new!(user_interests_new.id) end
    end

    test "change_user_interests_new/1 returns a user_interests_new changeset" do
      user_interests_new = user_interests_new_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user_interests_new(user_interests_new)
    end
  end
end
