defmodule ElixirBase.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ElixirBase.Repo,
      {DNSCluster, query: Application.get_env(:elixir_base, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ElixirBase.PubSub}
      # Start a worker by calling: ElixirBase.Worker.start_link(arg)
      # {ElixirBase.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: ElixirBase.Supervisor)
  end
end
