defmodule Mongodriver do
  @spec start(any, any) :: {:error, any} | {:ok, pid}
  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      worker(Mongo, [[name: :mongo, database: "test", pool_size: 2]])
    ]

    opts = [strategy: :one_for_one, name: MyApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def hello do
    :world
  end
end
