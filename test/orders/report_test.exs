defmodule Exdelivery.Orders.ReportTest do
  use ExUnit.Case

  alias Exdelivery.Orders.Agent, as: OrderAgent
  alias Exdelivery.Orders.Report

  import Exdelivery.Factory

  describe "create/1" do
    setup do
      OrderAgent.start_link(%{})
      filename = "report_test.csv"

      on_exit(fn -> File.rm!(filename) end)

      {:ok, filename: filename}
    end

    test "creates the report file", %{filename: filename} do
      :order
      |> build()
      |> OrderAgent.save()

      :order
      |> build()
      |> OrderAgent.save()

      expected_response =
        "11111111111,pizza,1,35.5japonesa,2,20.5,76.50\n" <>
          "11111111111,pizza,1,35.5japonesa,2,20.5,76.50\n"

      Report.create(filename)

      response = File.read!(filename)

      assert response == expected_response
    end
  end
end
