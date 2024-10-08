defmodule Something.ClockFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Something.Clock` context.
  """

  @doc """
  Generate a clocks.
  """
  def clocks_fixture(attrs \\ %{}) do
    {:ok, clocks} =
      attrs
      |> Enum.into(%{
        status: true,
        time: ~N[2024-10-07 13:35:00]
      })
      |> Something.Clock.create_clocks()

    clocks
  end
end
