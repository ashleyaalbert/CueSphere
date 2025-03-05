defmodule AppWeb.FacemashLive do
  use AppWeb, :live_view

  alias AppWeb.Components.Live.{RateComponent, PollComponent}

  def render(assigns) do
    ~H"""
    <.live_component module={RateComponent} id="rate-component" current_images={@current_images} />
    <.live_component module={PollComponent} id="poll-component" images={@images}  />
    """
  end

  def mount(_params, _session, socket) do
    images = Enum.map(1..10, &AppWeb.Endpoint.static_path("/images/facemash/#{&1}.jpg"))

    initial_votes = List.duplicate(0, length(images))

    current_images = Enum.take_random(images, 2)

    {:ok, assign(socket, images: images, current_images: current_images, votes: initial_votes, total_votes: 0)}
  end

  def handle_event("rate", %{"image" => image_url}, socket) do
    case Enum.find_index(socket.assigns.images, fn img -> img == image_url end) do
      nil -> {:noreply, socket}

      index ->
        votes = List.update_at(socket.assigns.votes, index, &(&1 + 1))
        total_votes = socket.assigns.total_votes + 1

        new_images = Enum.take_random(socket.assigns.images, 2)

        send_update(AppWeb.Components.Live.PollComponent,
          id: "poll-component",
          votes: votes,
          total_votes: total_votes
        )

        {:noreply, assign(socket, votes: votes, total_votes: total_votes, current_images: new_images)}
    end
  end

  def handle_event(event, params, socket) do
    AppWeb.LiveHelper.handle_event(event, params, socket)
  end

  def handle_info(message, socket) do
    AppWeb.LiveHelper.handle_info(message, socket)
  end
end
