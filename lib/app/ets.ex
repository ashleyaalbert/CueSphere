# defmodule App.ETS do
#   use GenServer

#   alias App.Games.TicTacToe

#   require Logger

#   @name __MODULE__

#   def start_link(_) do
#     # Start the GenServer
#     GenServer.start_link(@name, [], name: @name)
#   end

#   @doc """
#   Create and populate in-memory data tables.
#   """
#   def init(_) do
#     :ets.new(:tic_tac_toes, [:ordered_set, :named_table, :public, {:read_concurrency, true}])
#     {:ok, []}
#   end

#   def create_game do
#     game = TicTacToe.build_game()
#     :ets.insert(:tic_tac_toes, {game.id, game})
#     game
#   end

#   def join_game(game) do
#     game = TicTacToe.join_game(game)
#     :ets.insert(:tic_tac_toes, {game.id, game})
#     game
#   end

#   def update_game(game, attrs) do
#     game = TicTacToe.update_game(game, attrs)
#     :ets.insert(:tic_tac_toes, {game.id, game})
#     game
#   end

#   def get_game(id) do
#     case :ets.lookup(:tic_tac_toes, id) do
#       [{_slug, game}] -> game
#       _ -> nil
#     end
#   end

#   defp create_random_mines do
#     List.duplicate(true, 9) ++ List.duplicate(false, 72)
#     |> Enum.shuffle()
#   end
# end
