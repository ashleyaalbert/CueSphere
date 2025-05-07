defmodule App.ETS do
  use GenServer

  alias App.Games.MineSweeper

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  @impl true
  def init(_opts) do
    require Logger

    :ets.new(:minesweepers, [:ordered_set, :named_table, :public, {:read_concurrency, true}])

    # Create the :planets ETS table if it doesn't exist
    :ets.new(:planets, [:named_table, :public, read_concurrency: true])

    yaml_path = Path.join([:code.priv_dir(:app), "planets.yaml"])

    case YamlElixir.read_from_file(yaml_path) do
      {:ok, planet_maps} when is_list(planet_maps) ->
        #Logger.info("Successfully read planets.yaml: #{inspect(planet_maps)}")
        planets =
          planet_maps
          |> Enum.with_index(1)
          |> Enum.map(fn {params, id} ->
            # Add the id to the planet parameters
            params_with_id = Map.put(params, "id", id)

            case App.Planets.Planet.build!(params_with_id) do
              {:ok, planet} ->
                {id, %{planet | id: id}} # Ensure the id is part of the planet struct

              {:error, changeset} ->
                Logger.warning("Invalid planet data at id #{id}: #{inspect(changeset.errors)}")
                nil
            end
          end)
          |> Enum.reject(&is_nil/1)

        :ets.insert(:planets, planets)
        Logger.info("Planet table created and populated with #{length(planets)} planets.")
    end

    {:ok, %{}}
  end

  @doc """
  Creates a game and inserts it into the ETS table.
  """
  def create_game do
    game = MineSweeper.build_game()
    :ets.insert(:minesweepers, {game.id, game})
    game
  end

  @doc """
  Updates a game in the ETS table.
  """
  def update_game(game, attrs) do
    game = MineSweeper.update_game(game, attrs)
    :ets.insert(:minesweepers, {game.id, game})
    game
  end

  @doc """
  Takes the id of a game and gets it from the ETS table.
  """
  def get_game(id) do
    case :ets.lookup(:minesweepers, id) do
      [{_slug, game}] -> game
      _ -> nil
    end
  end

  @doc """
  Takes the id of a game and the new game state and updates it in the ETS table.
  """
  def set_state(id, game) do
    :ets.insert(:minesweepers, {id, game})
    game
  end

  @doc """
  Returns a list of 89 booleans with 9 of them mines at random positions.
  """
  def create_random_mines do
    List.duplicate(true, 9) ++ List.duplicate(false, 72)
    |> Enum.shuffle()
  end

  @doc """
  Figures out the count of adjacent mines for a given index.
  """
  def adjacent_count(game, index) do
    x = rem(index, 9)
    y = div(index, 9)

    for dx <- -1..1, dy <- -1..1, dx != 0 or dy != 0,
        x + dx in 0..8,
        y + dy in 0..8,
        reduce: 0 do
      acc ->
        neighbor_index = get_index(x + dx, y + dy)
        if Enum.at(game.mine_map, neighbor_index), do: acc + 1, else: acc
    end
  end

  defp get_index(x,y), do: y * 9 + x
end
