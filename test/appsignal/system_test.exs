defmodule Appsignal.SystemTest do
  use ExUnit.Case

  describe "when on Heroku" do
    setup do
      System.put_env "DYNO", "1"
      on_exit fn ->
        System.delete_env "DYNO"
      end
    end

    test "returns true" do
      assert Appsignal.System.heroku?
    end
  end

  describe "when not on Heroku" do
    setup do
      System.delete_env "DYNO"
    end

    test "returns false" do
      refute Appsignal.System.heroku?
    end
  end
end
