defmodule Something.WorkingtimesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Something.Workingtimes` context.
  """

  @doc """
  Generate a workingtime.
  """
  def workingtime_fixture(attrs \\ %{}) do
    {:ok, workingtime} =
      attrs
      |> Enum.into(%{
        end: ~N[2024-10-07 13:38:00],
        start: ~N[2024-10-07 13:38:00]
      })
      |> Something.Workingtimes.create_workingtime()

    workingtime
  end
end
