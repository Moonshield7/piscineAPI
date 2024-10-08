defmodule Something.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      SomethingWeb.Telemetry,
      Something.Repo,
      {DNSCluster, query: Application.get_env(:piscineAPI, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Something.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Something.Finch},
      # Start a worker by calling: Something.Worker.start_link(arg)
      # {Something.Worker, arg},
      # Start to serve requests, typically the last entry
      SomethingWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Something.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SomethingWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
