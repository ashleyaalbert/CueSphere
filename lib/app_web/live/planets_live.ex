defmodule AppWeb.PlanetsLive do
  use AppWeb, :live_view

  alias App.Planets

  def mount(_params, _session, socket) do
    {:ok, assign(socket, planets: Planets.list_planets(:sorted_by_name), sort_by: :name, sort_order: :asc)}
  end

  def handle_event("sort", %{"column" => column}, socket) do
    column = String.to_existing_atom(column)
    new_order = if socket.assigns.sort_by == column and socket.assigns.sort_order == :asc, do: :desc, else: :asc
    sorted_planets = Planets.list_planets({column, new_order})

    {:noreply, assign(socket, planets: sorted_planets, sort_by: column, sort_order: new_order)}
  end

  def render(assigns) do
    ~H"""
    <div class="overflow-x-auto">
      <table class="table-auto w-full text-left border-collapse border border-gray-300">
        <thead>
          <tr class="bg-gray-100">
            <th class="px-4 py-2 cursor-pointer" phx-click="sort" phx-value-column="name">
              Name <%= if @sort_by == :name, do: if @sort_order == :asc, do: "▲", else: "▼" %>
            </th>
            <th class="px-4 py-2 cursor-pointer" phx-click="sort" phx-value-column="orbital_period">
              Orbital Period <%= if @sort_by == :orbital_period, do: if @sort_order == :asc, do: "▲", else: "▼" %>
            </th>
          </tr>
        </thead>
        <tbody>
          <%= for planet <- @planets do %>
            <tr class="border-t">
              <td class="px-4 py-2"><%= planet.name %></td>
              <td class="px-4 py-2"><%= planet.orbital_period %></td>
            </tr>
          <% end %>
        </tbody>
      </table>
    </div>
    """
  end
end
