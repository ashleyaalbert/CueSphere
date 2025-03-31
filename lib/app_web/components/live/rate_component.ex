defmodule AppWeb.Components.Live.RateComponent do
  use AppWeb, :live_component

  def render(assigns) do
    ~H"""
    <div class="p-4 bg-white rounded-lg shadow-md dark:bg-gray-700 dark:text-white">
      <h2 class="text-xl font-bold mb-2 text-center">{gettext("Where would you rather be?")}</h2>
      <div class="flex gap-4 justify-center">
        <%= for image <- @current_images do %>
          <div class="text-center">
            <img src={image} class="w-60 h-48 cursor-pointer hover:opacity-80 border-4 border-transparent hover:border-blue-500 rounded-lg transition"
                 phx-click="rate" phx-value-image={image}/>
          </div>
        <% end %>
      </div>
    </div>
    """
  end

  def update(assigns, socket) do
    {:ok, assign(socket, current_images: assigns.current_images)}
  end
end
