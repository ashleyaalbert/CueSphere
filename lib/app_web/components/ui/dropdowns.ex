defmodule AppWeb.Components.UI.Dropdowns do
  use Phoenix.Component

  attr :id, :string, required: true
  attr :label, :string, default: "Dropdown"
  attr :items, :list, default: [
    %{label: "Dashboard", href: "#"},
    %{label: "Settings", href: "#"},
    %{label: "Earnings", href: "#"},
    %{label: "Sign out", href: "#"}
  ]

  # import AppWeb.Components.UI.Dropdowns
  # <.dropdown id="myDropdown" label="Menu" items={[
  #   %{label: "Profile", href: "/about"},
  #   %{label: "Settings", href: "/about"},
  #   %{label: "Log out", href: "/about"}
  # ]} />

  def dropdown(assigns) do
    ~H"""
    <div class="relative inline-block text-left">
      <button
        id={@id <> "Button"}
        data-dropdown-toggle={@id}
        type="button"
        class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center inline-flex items-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
      >
        <%= @label %>
        <svg class="w-2.5 h-2.5 ms-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4"/>
        </svg>
      </button>

      <div
        id={@id}
        class="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow-sm w-44 dark:bg-gray-700"
      >
        <ul class="py-2 text-sm text-gray-700 dark:text-gray-200" aria-labelledby={@id <> "Button"}>
          <%= for item <- @items do %>
            <li>
              <a href={item.href} class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">
                <%= item.label %>
              </a>
            </li>
          <% end %>
        </ul>
      </div>
    </div>
    """
  end
end
