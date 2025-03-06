defmodule AppWeb.PageLive.Index do
  use AppWeb, :live_view

  alias App.Content
  alias App.Content.Page

  @impl true
  # def mount(_params, _session, socket) do
  #   {:ok, stream(socket, :pages, Content.list_pages())}
  # end

  def mount(%{"slug" => slug}, _session, socket) do
    topic = Content.get_topic_by_slug!(slug)  # Get the topic
    pages = Content.list_pages_by_topic(topic.id)  # Fetch only pages for this topic

    {:ok, stream(assign(socket, topic: topic), :pages, pages)}
  end

  @impl true
  def handle_params(%{"slug" => slug} = params, _, socket) do
    topic = Content.get_topic_by_slug!(slug)
    pages = Content.list_pages_by_topic(topic.id)

    {:noreply,
     socket
     |> assign(:topic, topic)
     |> stream(:pages, pages)
     |> apply_action(socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Page")
    |> assign(:page, Content.get_page!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Page")
    |> assign(:page, %Page{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Pages")
    |> assign(:page, nil)
  end

  @impl true
  def handle_info({AppWeb.PageLive.FormComponent, {:saved, page}}, socket) do
    {:noreply, stream_insert(socket, :pages, page)}
  end

  def handle_info(message, socket) do
    AppWeb.LiveHelper.handle_info(message, socket)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    page = Content.get_page!(id)
    {:ok, _} = Content.delete_page(page)

    {:noreply, stream_delete(socket, :pages, page)}
  end

  def handle_event(event, params, socket) do
    AppWeb.LiveHelper.handle_event(event, params, socket)
  end
end
