defmodule App.Games.MineSweeper do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :mine_map, {:array, :boolean}
    field :open_map, {:array, :boolean}
    field :last_opened, :integer
    field :finished, :boolean
  end

  def build_game do
    mine_map = App.ETS.create_random_mines()
    open_map = List.duplicate(false, 81)

    %App.Games.MineSweeper{}
    |> cast(%{}, [])
    |> put_change(:mine_map, mine_map)
    |> put_change(:open_map, open_map)
    |> put_change(:last_opened, nil)
    |> put_change(:finished, false)
    |> apply_action!(:built)
  end

  def update_game(game, attrs) do
    game
    |> cast(attrs, ~w(open_map last_opened finished)a)
    |> apply_action!(:updated)
  end
end
