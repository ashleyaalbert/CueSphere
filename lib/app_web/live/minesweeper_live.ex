defmodule AppWeb.MinesweeperLive do
  use AppWeb, :live_view
  alias App.ETS

  def mount(_params, _session, socket) do
    game = ETS.create_game()
    {:ok, assign(socket, game: game, won: false)}
  end

  def handle_event("open", %{"index" => index_str}, socket) do
    index = String.to_integer(index_str)
    game = socket.assigns.game

    if Enum.at(game.open_map, index) or game.finished do
      {:noreply, socket}
    else
      is_mine = Enum.at(game.mine_map, index)

      open_map =
        if is_mine do
          # Open all mines
          Enum.with_index(game.mine_map)
          |> Enum.map(fn {is_mine, i} -> is_mine or Enum.at(game.open_map, i) end)
        else
          List.replace_at(game.open_map, index, true)
        end

      finished = is_mine or all_safe_cells_open?(game.mine_map, open_map)

      # Check win condition (opened all non-mine cells)
      num_opened = Enum.count(open_map, & &1)
      num_mines = Enum.count(game.mine_map, & &1)
      has_won = num_opened == 81 - num_mines

      updated_game =
        game
        |> Map.put(:open_map, open_map)
        |> Map.put(:last_opened, index)
        |> Map.put(:finished, finished)

      App.ETS.set_state(game.id, updated_game)
      # Assign a 'won' state to indicate the game was won
      socket =
        if has_won do
          assign(socket, game: updated_game, won: true)
        else
          assign(socket, game: updated_game, won: false)
        end

      {:noreply, socket}
    end
  end

  def handle_event("new_game", _params, socket) do
    new_game = App.ETS.create_game()
    {:noreply, assign(socket, game: new_game)}
  end

  defp remaining_mines(game) do
    total_mines = Enum.count(game.mine_map, & &1)
    opened_mines = Enum.zip(game.mine_map, game.open_map)
                     |> Enum.count(fn {is_mine, is_open} -> is_mine and is_open end)

    total_mines - opened_mines
  end

  defp all_safe_cells_open?(mine_map, open_map) do
    Enum.zip(mine_map, open_map)
    |> Enum.all?(fn {is_mine, is_open} -> is_mine or is_open end)
  end

  def render(assigns) do
    ~H"""
    <div class="p-0 m-0">
      <h1 class="text-xl font-bold mb-4">Minesweeper</h1>
      <div class="text-lg mb-2">
        💣 Mines Remaining: <%= remaining_mines(@game) %>
      </div>
      <div class="grid grid-cols-9 w-fit border border-gray-500">
        <%= for {open, index} <- Enum.with_index(@game.open_map) do %>
          <% is_mine = Enum.at(@game.mine_map, index) %>
          <% revealed = open or (@game.finished and is_mine) %>

          <button
            phx-click="open"
            phx-value-index={index}
            class={[
              "w-6 h-6 text-xs dark:text-black font-bold border border-gray-500 flex items-center justify-center p-0 m-0",
              revealed && is_mine && "bg-red-600 text-white",
              revealed && not is_mine && "bg-gray-300",
              !revealed && "bg-gray-400 hover:bg-gray-300",
            ]}
            disabled={@game.finished or open}
          >
            <%= if revealed do %>
              <%= if is_mine, do: "💣", else: App.ETS.adjacent_count(@game, index) %>
            <% end %>
          </button>
        <% end %>
      </div>

      <%= if @won do %>
        <div class="text-green-700 font-bold mb-2">🎉You won!</div>
      <% end %>
      <%= if @game.finished && !@won do %>
        <div class="text-red-700 font-bold mb-2">💥Game over!</div>
      <% end %>
    </div>

    <div class="mt-4">
      <.button
        type="submit"
        color="alternative"
        class="px-4 py-2 bg-blue-600 hover:bg-gray-200 text-white rounded"
        phx-click="new_game">
        New Game
      </.button>
    </div>
    """
  end
end
