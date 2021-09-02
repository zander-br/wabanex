defmodule Wabanex.Repo.Migrations.AlterUsersTable do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :height, :float
      add :weight, :float
      add :fat_index, :float
      add :muscle_index, :float
    end
  end
end
