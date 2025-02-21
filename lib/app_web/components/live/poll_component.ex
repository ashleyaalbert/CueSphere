defmodule AppWeb.Components.Live.PollComponent do
  use AppWeb, :live_component

  def render(assigns) do
    ~H"""
    <div class="p-4 bg-white rounded-lg shadow-md mt-4">
      <h2 class="text-xl font-bold mb-2">Poll Results</h2>
      <button phx-click="toggle" class="px-4 py-2 bg-blue-500 text-white rounded-md hover:bg-blue-600 transition">
        <%= if @show_results, do: "Hide Results", else: "Show Results" %>
      </button>

      <%= if @show_results do %>
        <ul class="mt-4 space-y-2">
          <%= for {image, votes} <- Enum.zip(@images, @votes) do %>
            <li class="flex items-center gap-2">
              <img src={image} width="50" class="rounded-md" />
              <div class="w-full bg-gray-200 rounded-full h-4">
                <div class="bg-green-500 h-4 rounded-full transition-all" style={"width: #{if @total_votes > 0, do: (votes * 100) / @total_votes, else: 0}%"}></div>
              </div>
              <span class="text-sm font-semibold"><%= votes %> votes</span>
            </li>
          <% end %>
        </ul>
      <% end %>
    </div>
    """
  end

  def mount(socket) do
    {:ok, assign(socket, votes: [], total_votes: 0, show_results: false)}
  end

  def update(%{images: images}, socket) do
    {:ok, assign(socket, images: images, votes: List.duplicate(0, length(images)), total_votes: 0, show_results: false)}
  end

  def update(%{index: index}, socket) do
    votes = List.update_at(socket.assigns.votes, index, &(&1 + 1))
    {:ok, assign(socket, votes: votes, total_votes: Enum.sum(votes))}
  end

  def handleevent("toggle", _, socket) do
    {:noreply, assign(socket, show_results: !socket.assigns.show_results)}
  end
end
