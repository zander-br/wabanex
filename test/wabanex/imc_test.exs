defmodule Wabanex.IMCTest do
  use ExUnit.Case, async: true

  alias Wabanex.IMC

  describe "calculate/1" do
    test "when the file exists, returns the data" do
      params = %{"filename" => "students.csv"}
      response = IMC.calculate(params)

      expected_response =
        {:ok,
         %{
           "Anderson" => 27.64,
           "Dani" => 23.44,
           "Diego" => 23.04,
           "Gabul" => 22.86,
           "Rodrigo" => 26.23
         }}

      assert response == expected_response
    end

    test "when then wrong filename is given, returns an error" do
      params = %{"filename" => "another.csv"}
      response = IMC.calculate(params)
      expected_response = {:error, "Error while opening the file"}
      assert response == expected_response
    end
  end
end
