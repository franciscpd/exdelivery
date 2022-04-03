defmodule Exdelivery.Users.AgentTest do
  use ExUnit.Case

  alias Exdelivery.Users.Agent, as: UserAgent
  alias Exdelivery.Users.User

  import Exdelivery.Factory

  describe "save/1" do
    test "saves the user" do
      user = build(:user)

      UserAgent.start_link(%{})

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})

      cpf = "12345678901"

      {:ok, cpf: cpf}
    end

    test "when the user is found, returns the user", %{cpf: cpf} do
      :user
      |> build(cpf: cpf)
      |> UserAgent.save()

      response = UserAgent.get(cpf)

      expected_response =
        {:ok,
         %User{
           address: "Rua das graças",
           age: 32,
           cpf: "12345678901",
           email: "francis@teste.com",
           name: "Francis Soares"
         }}

      assert response == expected_response
    end

    test "when the user is not found, returns an error" do
      response = UserAgent.get("12345678901")

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
