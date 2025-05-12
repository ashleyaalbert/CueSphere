defmodule App.Tournaments.TournamentPlayer do
  use Ecto.Schema

  schema "tournaments_players" do
    belongs_to :tournament, App.Tournaments.Tournament
    belongs_to :player, App.Accounts.User
    timestamps()
  end
end
