defmodule App.Tournaments do
  import Ecto.Query, warn: false
  alias App.Repo
  alias App.Tournaments.{Tournament, TournamentPlayer}
  alias App.Accounts.User

  # Tournament CRUD
  def list_tournaments do
    Repo.all(Tournament) |> Repo.preload([:creator, :players])
  end

  def get_tournament!(id), do: Repo.get!(Tournament, id) |> Repo.preload([:creator, :players])

  def create_tournament(user, attrs, uploaded_files) do
    %Tournament{}
    |> Tournament.changeset(attrs)
    |> Ecto.Changeset.put_embed(:pictures, uploaded_files)
    |> Ecto.Changeset.put_assoc(:creator, user)
    |> Repo.insert()
  end

  def update_tournament(%Tournament{} = tournament, attrs) do
    tournament
    |> Tournament.changeset(attrs)
    |> Repo.update()
  end

  def delete_tournament(%Tournament{} = tournament, %User{} = user) do
    if tournament.creator_id == user.id do
      Repo.delete(tournament)
    else
      {:error, :not_authorized}
    end
  end

  # Player management
  def add_player_to_tournament(tournament_id, player_id) do
    %TournamentPlayer{}
    |> Ecto.Changeset.change(%{tournament_id: tournament_id, player_id: player_id})
    |> Repo.insert()
  end

  def remove_player_from_tournament(tournament_id, player_id) do
    Repo.get_by(TournamentPlayer, tournament_id: tournament_id, player_id: player_id)
    |> Repo.delete()
  end

  def player_in_tournament?(tournament_id, player_id) do
    Repo.exists?(
      from tp in TournamentPlayer,
        where: tp.tournament_id == ^tournament_id and tp.player_id == ^player_id
    )
  end

  def change_tournament(%Tournament{} = tournament, attrs \\ %{}) do
    Tournament.changeset(tournament, attrs)
  end
end
