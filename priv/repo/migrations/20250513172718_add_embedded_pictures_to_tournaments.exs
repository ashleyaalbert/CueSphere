defmodule App.Repo.Migrations.AddEmbeddedPicturesToTournaments do
  use Ecto.Migration

  def change do
    alter table(:tournaments) do
      add :pictures, :map
    end
  end
end
