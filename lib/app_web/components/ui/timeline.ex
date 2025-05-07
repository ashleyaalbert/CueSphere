defmodule AppWeb.Components.UI.Timeline do
  @moduledoc """
  Timeline Component
  based on: https://flowbite.com/docs/components/timeline/
  """

  use Phoenix.Component

  @doc """
  Renders a timeline component.
  """

  attr :entries, :list, required: true, doc: "List of timeline entries with date, title, description, optional link and link_text"

  def timeline(assigns) do
    ~H"""
      <ol class="relative border-s border-gray-200 dark:border-gray-700">
      <%= for entry <- @entries do %>
        <li class="mb-10 ms-4">
          <div class="absolute w-3 h-3 bg-gray-200 rounded-full mt-1.5 -start-1.5 border border-white dark:border-gray-900 dark:bg-gray-700"></div>
          <time class="mb-1 text-sm font-normal leading-none text-gray-400 dark:text-gray-500"><%= entry.date %></time>
          <h3 class="text-lg font-semibold text-gray-900 dark:text-white"><%= entry.title %></h3>
          <p class="mb-4 text-base font-normal text-gray-500 dark:text-gray-400"><%= entry.description %></p>
          <%= if entry[:link] && entry[:link_text] do %>
            <a href={entry.link} class="inline-flex items-center px-4 py-2 text-sm font-medium text-gray-900 bg-white border border-gray-200 rounded-lg hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-4 focus:outline-none focus:ring-gray-100 focus:text-blue-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700 dark:focus:ring-gray-700">
              <%= entry.link_text %>
              <svg class="w-3 h-3 ms-2 rtl:rotate-180" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 10">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 5h12m0 0L9 1m4 4L9 9"/>
              </svg>
            </a>
          <% end %>
        </li>
      <% end %>
    </ol>
    """
  end
end
