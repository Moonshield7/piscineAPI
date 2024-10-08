defmodule Something.ClockTest do
  use Something.DataCase

  alias Something.Clock

  describe "clock" do
    alias Something.Clock.Clocks

    import Something.ClockFixtures

    @invalid_attrs %{status: nil, time: nil}

    test "list_clock/0 returns all clock" do
      clocks = clocks_fixture()
      assert Clock.list_clock() == [clocks]
    end

    test "get_clocks!/1 returns the clocks with given id" do
      clocks = clocks_fixture()
      assert Clock.get_clocks!(clocks.id) == clocks
    end

    test "create_clocks/1 with valid data creates a clocks" do
      valid_attrs = %{status: true, time: ~N[2024-10-07 13:35:00]}

      assert {:ok, %Clocks{} = clocks} = Clock.create_clocks(valid_attrs)
      assert clocks.status == true
      assert clocks.time == ~N[2024-10-07 13:35:00]
    end

    test "create_clocks/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Clock.create_clocks(@invalid_attrs)
    end

    test "update_clocks/2 with valid data updates the clocks" do
      clocks = clocks_fixture()
      update_attrs = %{status: false, time: ~N[2024-10-08 13:35:00]}

      assert {:ok, %Clocks{} = clocks} = Clock.update_clocks(clocks, update_attrs)
      assert clocks.status == false
      assert clocks.time == ~N[2024-10-08 13:35:00]
    end

    test "update_clocks/2 with invalid data returns error changeset" do
      clocks = clocks_fixture()
      assert {:error, %Ecto.Changeset{}} = Clock.update_clocks(clocks, @invalid_attrs)
      assert clocks == Clock.get_clocks!(clocks.id)
    end

    test "delete_clocks/1 deletes the clocks" do
      clocks = clocks_fixture()
      assert {:ok, %Clocks{}} = Clock.delete_clocks(clocks)
      assert_raise Ecto.NoResultsError, fn -> Clock.get_clocks!(clocks.id) end
    end

    test "change_clocks/1 returns a clocks changeset" do
      clocks = clocks_fixture()
      assert %Ecto.Changeset{} = Clock.change_clocks(clocks)
    end
  end
end
