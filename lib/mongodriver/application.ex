defmodule Mongodriver.Application do

 @moduledoc false
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Mongodriver.Worker.start_link(arg)
      # {Mongodriver.Worker, arg}

      {Mongo, name: :mongo, database: "database name", pool_size: 2}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Mongodriver.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
