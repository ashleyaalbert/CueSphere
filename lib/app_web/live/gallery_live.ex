defmodule AppWeb.GalleryLive do
  use AppWeb, :live_view

  @thumbnails [
    %{id: 1, thumb: "bar_thumbnail.jpg", full: "bar_fullsize.jpg"},
    %{id: 2, thumb: "concert_thumbnail.jpg", full: "concert_fullsize.jpg"},
    %{id: 3, thumb: "cs_thumbnail.jpg", full: "cs_fullsize.jpg"},
    %{id: 4, thumb: "formal_thumbnail.jpg", full: "formal_fullsize.jpg"},
    %{id: 5, thumb: "pool_thumbnail.jpg", full: "pool_fullsize.jpg"}
  ]

  def mount(_params, _session, socket) do
    first_image = List.first(@thumbnails).full

    {:ok,
     assign(socket,
       thumbnails: @thumbnails,
       selected_image: first_image
     )}
  end

  def handle_event("select-image", %{"id" => id}, socket) do
    thumb = Enum.find(@thumbnails, fn t -> Integer.to_string(t.id) == id end)
    {:noreply, assign(socket, selected_image: thumb.full)}
  end
end
