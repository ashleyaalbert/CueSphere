defmodule AppWeb.FargoRateLive do
  use AppWeb, :live_view

  # alias App.Scraper
  @url "https://dashboard.fargorate.com/api/indexsearch?q="

  @impl true
  def render(assigns) do
    ~H"""
    <div class="p-4">
    <.form for={} phx-submit="search">
      <input name="query" type="text" value={@query} placeholder={gettext("Search for a player...")} class="border rounded p-2 mr-2" />
      <.button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded">{gettext("Search")}</.button>
    </.form>

      <%= if @error do %>
        <p class="text-red-600 mt-4"><%= inspect(@error) %></p>
      <% end %>
      <table class="mt-4 w-full table-auto border-collapse border border-gray-300">
        <thead>
          <tr>
            <th class="border p-2">{gettext("First Name")}</th>
            <th class="border p-2">{gettext("Last Name")}</th>
            <th class="border p-2">{gettext("Fargo Rate")}</th>
            <th class="border p-2">{gettext("Robustness")}</th>
            <th class="border p-2">{gettext("Membership ID")}</th>
            <th class="border p-2">{gettext("Location")}</th>
          </tr>
        </thead>
        <tbody>
          <%= for player <- @players do %>
            <tr>
              <td class="border p-2"><%= player["firstName"] %></td>
              <td class="border p-2"><%= player["lastName"] %></td>
              <td class="border p-2"><%= player["effectiveRating"] %></td>
              <td class="border p-2"><%= player["robustness"] %></td>
              <td class="border p-2"><%= player["membershipId"] %></td>
              <td class="border p-2"><%= player["location"] || "N/A" %></td>
            </tr>
          <% end %>
        </tbody>
      </table>
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
end
