defmodule Exdelivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exdelivery.Users.Agent, as: UserAgent
  alias Exdelivery.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when all params are valid, saves the user" do
      params = %{
        name: "Francis",
        address: "Rua das graças",
        email: "franciscpd@gmail.com",
        cpf: "12345678901",
        age: 32
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "User created or updated successfully"}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "Francis",
        address: "Rua das graças",
        email: "franciscpd@gmail.com",
        cpf: "12345678901",
        age: 15
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
