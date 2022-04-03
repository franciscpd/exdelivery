defmodule Exdelivery do
  alias Exdelivery.Orders.Agent, as: OrderAgent
  alias Exdelivery.Orders.CreateOrUpdate, as: CreateOrUpdateOrder
  alias Exdelivery.Users.Agent, as: UserAgent
  alias Exdelivery.Users.CreateOrUpdate, as: CreateOrUpdateUser

  def start_agents do
    OrderAgent.start_link(%{})
    UserAgent.start_link(%{})
  end

  defdelegate create_or_update_order(params), to: CreateOrUpdateOrder, as: :call
  defdelegate create_or_update_user(params), to: CreateOrUpdateUser, as: :call
end
