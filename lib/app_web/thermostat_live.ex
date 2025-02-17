defmodule AppWeb.ThermostatLive do
  use AppWeb, :live_view

  def render(assigns) do
    ~H"""
    Current temperature:
    <.button phx-click="change_temperature" phx-value-direction="down">-</.button>
    {@temperature}°F
    <.button phx-click="change_temperature" phx-value-direction="up">+</.button>
    """
  end

  def mount(_params, _session, socket) do
    temperature = 70 # Let's assume a fixed temperature for now
    {:ok, assign(socket, :temperature, temperature)}
  end

  def handle_event("change_temperature", %{"direction" => "down"}, socket) do
    {:noreply, update(socket, :temperature, &(&1 - 1))}
  end

  def handle_event("change_temperature", %{"direction" => "up"}, socket) do
    {:noreply, update(socket, :temperature, &(&1 + 1))}
  end
end
