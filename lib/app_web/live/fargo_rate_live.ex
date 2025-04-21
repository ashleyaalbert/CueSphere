defmodule AppWeb.FargoRateLive do
  use AppWeb, :live_view

  # alias App.Scraper
  @url "https://dashboard.fargorate.com/api/indexsearch?q="

  @impl true
  def render(assigns) do
    ~H"""
    <div class="p-4">
    <.form for={} phx-submit="search">
      <input name="query" type="text" value={@query} placeholder="Search for a player..." class="border rounded p-2 mr-2" />
      <.button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded">Search</.button>
    </.form>

      <%= if @error do %>
        <p class="text-red-600 mt-4"><%= inspect(@error) %></p>
      <% end %>
      <%!-- <p class="text-sm text-gray-600 mt-2">Query: <%= @query %></p>
      <pre class="text-xs text-gray-500 bg-gray-100 p-2 mt-2"><%= inspect(@players) %></pre> --%>
      <table class="mt-4 w-full table-auto border-collapse border border-gray-300">
        <thead>
          <tr>
            <th class="border p-2">First Name</th>
            <th class="border p-2">Last Name</th>
            <th class="border p-2">Fargo Rate</th>
            <th class="border p-2">Membership ID</th>
            <th class="border p-2">Robustness</th>
            <th class="border p-2">Location</th>
          </tr>
        </thead>
        <tbody>
          <%= for player <- @players do %>
            <tr>
              <td class="border p-2"><%= player["firstName"] %></td>
              <td class="border p-2"><%= player["lastName"] %></td>
              <td class="border p-2"><%= player["effectiveRating"] %></td>
              <td class="border p-2"><%= player["membershipId"] %></td>
              <td class="border p-2"><%= player["robustness"] %></td>
              <td class="border p-2"><%= player["location"] || "N/A" %></td>
            </tr>
          <% end %>
        </tbody>
      </table>
    </div>
    <div class="mt-4">
      <.button phx-click="next" class="bg-green-500 text-white px-4 py-2 rounded">
        Next Page
      </.button>
    </div>
    """
  end

  defp fetch_players_page(query, last_id \\ nil) do
    url = build_url(query, last_id)

    case HTTPoison.get(url, [], recv_timeout: 5_000) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        case Jason.decode(body) do
          {:ok, %{"value" => players}} ->
            last_player = List.last(players)
            last_id = if last_player, do: last_player["id"], else: nil

            filtered_players =
              Enum.filter(players, fn player ->
                full_name =
                  [player["firstName"], player["lastName"]]
                  |> Enum.filter(& &1)
                  |> Enum.join(" ")
                  |> String.downcase()

                query
                |> String.downcase()
                |> String.split()
                |> Enum.all?(fn token -> String.contains?(full_name, token) end)
              end)

            {:ok, %{players: filtered_players, last_id: last_id}}

          {:ok, _other} -> {:error, "Unexpected JSON structure"}
          {:error, err} -> {:error, err}
        end

      {:ok, %HTTPoison.Response{status_code: code}} ->
        {:error, "Received status #{code}"}

      {:error, error} -> {:error, error}
    end
  end

  defp build_url(query, last_id) do
    if last_id do
      "#{@url}#{URI.encode(query)}&last_id=#{last_id}"
    else
      "#{@url}#{URI.encode(query)}"
    end
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, query: "", players: [], error: nil, last_id: nil)}
  end

  @impl true
  def handle_event("search", %{"query" => query}, socket) do
    case fetch_players_page(query) do
      {:ok, %{players: players, last_id: last_id}} ->
        {:noreply, assign(socket, query: query, players: players, last_id: last_id, error: nil)}

      {:error, reason} ->
        {:noreply, assign(socket, players: [], error: reason)}
    end
  end

  def handle_event("next", _, %{assigns: %{query: query, last_id: last_id}} = socket) do
    IO.inspect(query, label: "Query for next page")
    IO.inspect(last_id, label: "Last ID for next page")
    case fetch_players_page(query, last_id) do
      {:ok, %{players: players, last_id: new_last_id}} ->
        IO.inspect(players, label: "Next page players")
        {:noreply, assign(socket, players: players, last_id: new_last_id)}

      {:error, reason} ->
        {:noreply, assign(socket, error: reason)}
    end
  end

  # def handle_event("search", _params, socket) do
  #   query = "Shane Van Boening"
  #   case fetch_all_players(query) do
  #     {:ok, players} ->
  #       IO.inspect(players, label: "Fetched players")
  #       {:noreply, assign(socket, query: query, players: players, error: nil)}

  #     {:error, reason} ->
  #       IO.inspect(reason, label: "Fetch error")
  #       {:noreply, assign(socket, query: query, players: [], error: reason)}
  #   end
  # end

  # def search(query) do
  #   case HTTPoison.get(@url <> URI.encode(query), [], recv_timeout: 5_000) do
  #     {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
  #       case Jason.decode(body) do
  #         {:ok, %{"value" => players}} ->
  #           {:ok, players}

  #         {:ok, other} ->
  #           {:error, "Unexpected JSON structure: #{inspect(other)}"}

  #         {:error, decode_error} ->
  #           {:error, decode_error}
  #       end

  #     {:ok, %HTTPoison.Response{status_code: code}} ->
  #       {:error, "Received status #{code}"}

  #     {:error, error} ->
  #       {:error, error}
  #   end
  # end

  # @impl true
  # def mount(_params, _session, socket) do
  #   {:ok, assign(socket, query: "", players: [], error: nil)}
  # end

  # @impl true
  # def handle_event("search", %{"query" => query}, socket) do
  #   case search(query) do
  #     {:ok, players} ->
  #       {:noreply, assign(socket, query: query, players: players, error: nil)}

  #     {:error, reason} ->
  #       {:noreply, assign(socket, query: query, players: [], error: reason)}
  #   end
  # end
end
