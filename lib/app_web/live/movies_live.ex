defmodule AppWeb.MoviesLive do
  use AppWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <h>Movies PAGE</h>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
