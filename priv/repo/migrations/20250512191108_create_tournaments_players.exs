defmodule App.Repo.Migrations.CreateTournamentsPlayers do
  use Ecto.Migration

  def change do
    create table(:tournaments_players) do
      add :tournament_id, references(:tournaments, on_delete: :delete_all)
      add :player_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create unique_index(:tournaments_players, [:tournament_id, :player_id])
  end
end
