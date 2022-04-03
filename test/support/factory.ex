defmodule Exdelivery.Factory do
  use ExMachina

  alias Exdelivery.Orders.{Item, Order}
  alias Exdelivery.Users.User

  def user_factory do
    %User{
      name: "Francis Soares",
      email: "francis@teste.com",
      cpf: "11111111111",
      age: 32,
      address: "Rua das graças"
    }
  end

  def item_factory do
    %Item{
      description: "Pizza de calabresa",
      category: :pizza,
      unity_price: Decimal.new("35.5"),
      quantity: 1
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Rua das graças",
      user_cpf: "11111111111",
      total_price: Decimal.new("76.50"),
      items: [
        build(:item),
        build(:item,
          description: "Temaki de atum",
          category: :japonesa,
          quantity: 2,
          unity_price: Decimal.new("20.5")
        )
      ]
    }
  end
end
