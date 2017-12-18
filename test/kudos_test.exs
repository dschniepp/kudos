defmodule KudosTest do
  use ExUnit.Case
  doctest Kudos

  test "write file test" do
    assert Kudos.generate() == :ok
  end
end
