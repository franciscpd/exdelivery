defmodule Exdelivery.Orders.Agent do
  use Agent

  alias Exdelivery.Orders.Order

  def start_link(_initial_state) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def save(%Order{} = order) do
    uuid = UUID.uuid4()

    Agent.update(__MODULE__, &update_state(&1, order, uuid))

    {:ok, uuid}
  end

  def get(uuid), do: Agent.get(__MODULE__, &get_state(&1, uuid))

  def list_all, do: Agent.get(__MODULE__, & &1)

  defp update_state(state, %Order{} = order, uuid), do: Map.put(state, uuid, order)

  defp get_state(state, uuid) do
    case Map.get(state, uuid) do
      nil -> {:error, "Order not found"}
      order -> {:ok, order}
    end
  end
end
