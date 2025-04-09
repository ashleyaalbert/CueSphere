defmodule AppWeb.GalleryLive do
  use AppWeb, :live_view

  @thumbnails [
    %{id: 1, thumb: "bar_thumbnail.jpg", full: "bar_fullsize.jpg"},
    %{id: 2, thumb: "concert_thumbnail.jpg", full: "concert_fullsize.jpg"},
    %{id: 3, thumb: "cs_thumbnail.jpg", full: "cs_fullsize.jpg"},
    %{id: 4, thumb: "formal_thumbnail.jpg", full: "formal_fullsize.jpg"},
    %{id: 5, thumb: "pool_thumbnail.jpg", full: "pool_fullsize.jpg"}
  ]

  @impl true
  def mount(_params, _session, socket) do
    first_image = List.first(@thumbnails).full

    {:ok,
     assign(socket,
       thumbnails: @thumbnails,
       selected_image: first_image
     )}
  end

  @impl true
  def handle_event("select-image", %{"id" => id}, socket) do
    thumb = Enum.find(@thumbnails, fn t -> Integer.to_string(t.id) == id end)
    {:noreply, assign(socket, selected_image: thumb.full)}
  end

  @impl true
  def render(assigns) do
    ~H"""
      <div class="grid gap-4 p-4">
        <!-- Featured Image -->
        <div id="featured-container" phx-update="replace">
          <div id={"featured-#{:erlang.unique_integer()}"} class="animate-slide-in-right">
            <img
              class="h-auto max-w-full rounded-lg shadow-md aspect-square animate-slide-in-right"
              src={~p"/images/gallery/#{@selected_image}"}
              alt="Featured image"
              phx-hook="FeaturedImage"
              id="featured-image"
            />
          </div>
        </div>

        <!-- Thumbnails -->
        <div class="grid grid-cols-5 gap-4">
          <%= for t <- @thumbnails do %>
            <div>
              <button
                type="button"
                phx-click="select-image"
                phx-value-id={t.id}
                class="transform transition-transform duration-300 ease-in-out hover:scale-105 hover:ring-4 hover:ring-blue-300 rounded-lg"
              >
                <img
                  class="h-auto max-w-full rounded-lg aspect-square"
                  src={~p"/images/gallery/#{t.thumb}"}
                  alt="Thumbnail image"
                />
              </button>
            </div>
          <% end %>
        </div>
      </div>
    """
  end
end
