defmodule AppWeb.Components.Live.RateComponent do
  use AppWeb, :live_component

  def render(assigns) do
    ~H"""
    <div class="p-4 bg-gray-100 rounded-lg shadow-md">
      <h2 class="text-xl font-bold mb-2">Rate the Images</h2>
      <div class="flex gap-4 justify-center">
        <%= for {image, index} <- Enum.with_index(@images) do %>
          <div class="text-center">
            <img src={image} class="cursor-pointer hover:opacity-80 border-4 border-transparent hover:border-blue-500 rounded-lg transition" phx-click="rate" phx-value-index={index} width="150" />
          </div>
        <% end %>
      </div>
    </div>
    """
  end

  def update(assigns, socket) do
    images = Enum.take_random(assigns.images, 2)
    {:ok, assign(socket, images: images)}
  end

  def handle_event("rate", %{"index" => index}, socket) do
    send_update(AppWeb.Components.Live.PollComponent, id: "poll-component", index: index)
    images = Enum.take_random(socket.assigns.images, 2)
    {:noreply, assign(socket, images: images)}
  end
end
