defmodule Exdelivery.Users.UserTest do
  use ExUnit.Case

  alias Exdelivery.Users.User

  import Exdelivery.Factory

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response =
        User.build("Francis Soares", "francis@teste.com", "11111111111", 32, "Rua das graças")

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      response =
        User.build("Francisross", "francis@teste.com", "11111111111", 17, "Rua das graças")

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
