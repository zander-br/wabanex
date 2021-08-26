defmodule WabanexWeb.Resolvers.User do
  alias Wabanex.Users.Get

  def get(%{id: user_id}, _context), do: Get.call(user_id)
end
