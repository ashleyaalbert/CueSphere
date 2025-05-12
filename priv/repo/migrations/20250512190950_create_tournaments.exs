defmodule App.Repo.Migrations.CreateTournaments do
  use Ecto.Migration

  def change do
    create table(:tournaments) do
      add :name, :string
      add :location, :string
      add :date, :date
      add :type, :string
      add :creator_id, references(:users, on_delete: :delete_all)

      timestamps()
    end
  end
end
