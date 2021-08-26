defmodule WabanexWeb.Schema.Types.Root do
  use Absinthe.Schema.Notation

  alias Crudry.Middlewares.TranslateErrors
  alias WabanexWeb.Resolvers.User, as: UserResolver

  import_types WabanexWeb.Schema.Types.User

  object :root_query do
    field :user, type: :user do
      arg :id, non_null(:uuid4)
      resolve &UserResolver.get/2
    end
  end

  object :root_mutation do
    field :user, type: :user do
      arg :input, non_null(:create_user_input)
      resolve &UserResolver.create/2
      middleware TranslateErrors
    end
  end
end
