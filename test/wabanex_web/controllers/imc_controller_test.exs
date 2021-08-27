defmodule WabanexWeb.IMCControllerTest do
  use WabanexWeb.ConnCase, async: true

  describe "index/2" do
    test "when all params are valid, returns the imc info", %{conn: conn} do
      params = %{"filename" => "students.csv"}
      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:ok)
      expected_response = %{
        "result" => %{
          "Anderson" => 27.64,
          "Dani" => 23.44,
          "Diego" => 23.04,
          "Gabul" => 22.86,
          "Rodrigo" => 26.23
        }}
      assert response == expected_response
    end
  end
end
