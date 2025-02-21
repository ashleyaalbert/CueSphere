defmodule AppWeb.FacemashLive do
  use AppWeb, :live_view

  alias AppWeb.Components.Live.{RateComponent, PollComponent}
  alias App.Notification
  alias App.Notification.Message

  def render(assigns) do
    ~H"""
    <.live_component module={RateComponent} id="rate-component" images={@images} />
    <.live_component module={PollComponent} id="poll-component" images={@images} />
    """
  end

  # def mount(_params, _session, socket) do
  #   # choose 1..8 for female pictures and 9..18 for male pictures
  #   images = Enum.map(1..3, &AppWeb.Endpoint.static_path("/images/facemash/#{&1}.jpg"))
  #   {:ok, assign(socket, :images, images)}
  # end

  def mount(_params, _session, socket) do
    # TODO: CHANGE 1..3
    images = Enum.map(1..3, &AppWeb.Endpoint.static_path("/images/facemash/#{&1}.jpg"))

    # Assign message_changeset if required
    changeset = Notification.change_message(%Message{})

    {:ok,
     socket
     |> assign(:images, images)
     |> assign(:message_changeset, changeset)}
  end


end
