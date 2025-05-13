defmodule App.Tournaments.Tournament do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tournaments" do
    field :name, :string
    field :location, :string
    field :date, :date
    field :type, :string
    belongs_to :creator, App.Accounts.User

    many_to_many :players, App.Accounts.User,
      join_through: App.Tournaments.TournamentPlayer,
      join_keys: [tournament_id: :id, player_id: :id],
      on_replace: :delete

    embeds_many :pictures, App.Tournaments.Upload, on_replace: :delete

    timestamps()
  end

  def changeset(tournament, attrs) do
    tournament
    |> cast(attrs, [:name, :location, :date, :type])
    |> validate_required([:name, :location, :date, :type])
  end
end
