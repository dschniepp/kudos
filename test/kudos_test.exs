defmodule KudosTest do
  use ExUnit.Case
  doctest Kudos

  test "write file test" do
    assert String.length(Kudos.generate()) > 0
  end
end
