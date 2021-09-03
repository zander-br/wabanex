defmodule WabanexWeb.SchemaTest do
  use WabanexWeb.ConnCase, async: true
  alias Wabanex.User
  alias Wabanex.Users.Create

  describe "users queries" do
    test "when a valid id is given, returns the user", %{conn: conn} do
      params = %{name: "Joe Doe", email: "joe.doe@email.com", password: "123pass"}
      {:ok, %User{id: user_id}} = Create.call(params)

      query = """
        {
          user(id: "#{user_id}"){
            id
            name
            email
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      expected_response = %{
        "data" => %{
          "user" => %{
            "email" => "joe.doe@email.com",
            "id" => "#{user_id}",
            "name" => "Joe Doe"
          }
        }
      }

      assert response == expected_response
    end
  end

  describe "users mutations" do
    test "when all params are valid, creates the user", %{conn: conn} do
      mutation = """
        mutation {
          user(input: {
            name: "Joe Doe",
            email: "joe.doe@email.com",
            password: "123pass"}
          ){
            id
            name
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(:ok)

      assert %{"data" => %{"user" => %{"id" => _id, "name" => "Joe Doe"}}} = response
    end
  end
end
