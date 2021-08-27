defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.User

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Joe Doe", email: "joe.doe@email.com", password: "123pass"}
      response = User.changeset(params)
      assert %Ecto.Changeset{
        valid?: true,
        changes: %{email: "joe.doe@email.com", name: "Joe Doe", password: "123pass"},
        errors: []
      } = response
    end
  end
end
