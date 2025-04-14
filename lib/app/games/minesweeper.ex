defmodule App.Games.Minesweeper do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :mine_map, {:array, :boolean}  # 81 entries, represents where mines are
    field :open_map, {:array, :boolean}  # 81 entries, represents what is opened
    field :last_opened, :integer         # index of last field opened
    field :finished, :boolean            # for convenience, not actually needed
  end
end
