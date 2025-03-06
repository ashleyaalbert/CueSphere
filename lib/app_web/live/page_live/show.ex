defmodule AppWeb.PageLive.Show do
  use AppWeb, :live_view

  alias App.Content

  @impl true
  # def mount(_params, _session, socket) do
  #   {:ok, socket}
  # end

  def mount(%{"slug" => slug, "id" => page_id}, _session, socket) do
    topic = Content.get_topic_by_slug!(slug)
    page = Content.get_page!(page_id)

    {:ok, assign(socket, topic: topic, page: page)}
  end

  @impl true
  def handle_params(%{"slug" => slug, "id" => "new"}, _, socket) do
    topic = Content.get_topic_by_slug!(slug)

    IO.inspect(%{"slug" => slug, "id" => "new"}, label: "Params in handle_params")

    {:noreply,
     socket
     |> assign(:page_title, "New Page")
     |> assign(:page, %App.Content.Page{})
     |> assign(:topic, topic)}
  end

  def handle_params(%{"slug" => slug, "id" => id}, _, socket) do
    # Handle the case where a valid page ID is provided
    IO.inspect(%{"slug" => slug, "id" => id}, label: "Params in handle_params")

    topic = Content.get_topic_by_slug!(slug)
    page = Content.get_page!(id)

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:topic, topic)
     |> assign(:page, page)}
  end

  defp page_title(:show), do: "Show Page"
  defp page_title(:edit), do: "Edit Page"
end
