defmodule SomethingWeb.ClocksController do
  use SomethingWeb, :controller

  alias Something.Clock
  alias Something.Clock.Clocks

  action_fallback SomethingWeb.FallbackController

  def index(conn, _params) do
    clock = Clock.list_clock()
    render(conn, :index, clock: clock)
  end

  def create(conn, %{"clocks" => clocks_params}) do
    with {:ok, %Clocks{} = clocks} <- Clock.create_clocks(clocks_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/clock/#{clocks}")
      |> render(:show, clocks: clocks)
    end
  end

  def show(conn, %{"id" => id}) do
    clocks = Clock.get_clocks!(id)
    render(conn, :show, clocks: clocks)
  end

  def update(conn, %{"id" => id, "clocks" => clocks_params}) do
    clocks = Clock.get_clocks!(id)

    with {:ok, %Clocks{} = clocks} <- Clock.update_clocks(clocks, clocks_params) do
      render(conn, :show, clocks: clocks)
    end
  end

  def delete(conn, %{"id" => id}) do
    clocks = Clock.get_clocks!(id)

    with {:ok, %Clocks{}} <- Clock.delete_clocks(clocks) do
      send_resp(conn, :no_content, "")
    end
  end
end
