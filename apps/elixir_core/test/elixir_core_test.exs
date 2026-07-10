defmodule ElixirCoreTest do
  use ExUnit.Case
  doctest ElixirCore

  test "greets the world" do
    assert ElixirCore.hello() == :world
  end
end
