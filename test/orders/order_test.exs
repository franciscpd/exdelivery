defmodule Exdelivery.Orders.OrderTest do
  use ExUnit.Case

  alias Exdelivery.Orders.Order

  import Exdelivery.Factory

  describe "build/2" do
    test "when all params are valid, returns an order" do
      user = build(:user)

      items = [
        build(:item),
        build(:item,
          description: "Temaki de atum",
          category: :japonesa,
          quantity: 2,
          unity_price: Decimal.new("20.5")
        )
      ]

      reponse = Order.build(user, items)

      expected_response = {:ok, build(:order)}

      assert reponse == expected_response
    end

    test "when there is not items in the order, returns an error" do
      user = build(:user)

      items = []

      reponse = Order.build(user, items)

      expected_response = {:error, "Invalid parameters"}

      assert reponse == expected_response
    end
  end
end
