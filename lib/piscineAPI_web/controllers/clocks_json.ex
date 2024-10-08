defmodule SomethingWeb.ClocksJSON do
  alias Something.Clock.Clocks

  @doc """
  Renders a list of clock.
  """
  def index(%{clock: clock}) do
    %{data: for(clocks <- clock, do: data(clocks))}
  end

  @doc """
  Renders a single clocks.
  """
  def show(%{clocks: clocks}) do
    %{data: data(clocks)}
  end

  defp data(%Clocks{} = clocks) do
    %{
      id: clocks.id,
      time: clocks.time,
      status: clocks.status
    }
  end
end
