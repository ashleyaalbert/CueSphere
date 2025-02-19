defmodule AppWeb.ThermostatLive do
  alias App.Notification
  use AppWeb, :live_view

  alias Notification
  alias App.Notification
  alias App.Notification.Message

  def render(assigns) do
    ~H"""
    Current temperature:
    <.button phx-click="change_temperature" phx-value-direction="down">-</.button>
    {@temperature}°F
    <.button phx-click="change_temperature" phx-value-direction="up">+</.button>
    """
  end

  def mount(_params, _session, socket) do
    # Let's assume a fixed temperature for now
    temperature = 70
    {:ok,
     socket
     |> assign(:temperature, temperature)
     |> assign(:message_changeset, Notification.change_message(%Message{}))}
  end

  def handle_event("change_temperature", %{"direction" => "down"}, socket) do
    {:noreply, update(socket, :temperature, &(&1 - 1))}
  end

  def handle_event("change_temperature", %{"direction" => "up"}, socket) do
    {:noreply, update(socket, :temperature, &(&1 + 1))}
  end
end
