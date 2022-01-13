defmodule Single do
  def query do
    {:ok, conn} = Mongo.start_link(url: "mongodb://localhost:8000/backend")

    cursor = Mongo.find(conn, "user-collection", %{})

    cursor
    |> Enum.to_list()
    |> IO.inspect()
  end
end
