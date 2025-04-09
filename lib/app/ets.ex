defmodule App.ETS do
  use GenServer

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  @impl true
  def init(_opts) do
    require Logger

    # Create the :planets ETS table if it doesn't exist
    :ets.new(:planets, [:named_table, :public, read_concurrency: true])

    yaml_path = Path.join([:code.priv_dir(:app), "planets.yaml"])

    case YamlElixir.read_from_file(yaml_path) do
      {:ok, planet_maps} when is_list(planet_maps) ->
        Logger.info("Successfully read planets.yaml: #{inspect(planet_maps)}")
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


  # alias App.Games.TicTacToe

  # require Logger

  # @name __MODULE__

  # def start_link(_) do
  #   # Start the GenServer
  #   GenServer.start_link(@name, [], name: @name)
  # end

  # @doc """
  # Create and populate in-memory data tables.
  # """
  # def init(_) do
  #   :ets.new(:tic_tac_toes, [:ordered_set, :named_table, :public, {:read_concurrency, true}])
  #   {:ok, []}
  # end

  # def create_game do
  #   game = TicTacToe.build_game()
  #   :ets.insert(:tic_tac_toes, {game.id, game})
  #   game
  # end

  # def join_game(game) do
  #   game = TicTacToe.join_game(game)
  #   :ets.insert(:tic_tac_toes, {game.id, game})
  #   game
  # end

  # def update_game(game, attrs) do
  #   game = TicTacToe.update_game(game, attrs)
  #   :ets.insert(:tic_tac_toes, {game.id, game})
  #   game
  # end

  # def get_game(id) do
  #   case :ets.lookup(:tic_tac_toes, id) do
  #     [{_slug, game}] -> game
  #     _ -> nil
  #   end
  # end

  # defp create_random_mines do
  #   List.duplicate(true, 9) ++ List.duplicate(false, 72)
  #   |> Enum.shuffle()
  # end
end
