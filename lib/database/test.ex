defmodule Test do
    def read do
        File.stream!("lib/test.txt")
        |> Stream.map(&String.trim/1)
        |> Stream.chunk_every(2, 1, :discard)
        |> Enum.count(fn [a, b] -> a < b end)
        |> IO.inspect()
    end
end

