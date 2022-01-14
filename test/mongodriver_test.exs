defmodule MongodriverTest do
  use ExUnit.Case
  doctest Mongodriver

  test "greets the world" do
    assert Mongodriver.hello() == :world
  end
end
