defmodule AppWeb.FactsLive do
  use AppWeb, :live_view
  import AppWeb.Components.UI.Timeline

  @impl true
  def render(assigns) do
    ~H"""
    <h>FACTS PAGE</h>

    <.timeline entries={[
      %{
        date: "February 2022",
        title: "Application UI code in Tailwind CSS",
        description: "Get access to over 20+ pages including a dashboard layout, charts, kanban board, calendar, and more.",
        link: "#",
        link_text: "Learn more"
      },
      %{
        date: "March 2022",
        title: "Marketing UI design in Figma",
        description: "All pages and components are first designed in Figma and updated in sync."
      },
      %{
        date: "April 2022",
        title: "E-Commerce UI code in Tailwind CSS",
        description: "Get started with dozens of web components and interactive elements built on Tailwind CSS."
      }
    ]} />
    """
  end
end
