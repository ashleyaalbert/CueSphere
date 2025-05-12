defmodule AppWeb.Components.UI.Dropdowns do
  use Phoenix.Component

  attr :id, :string, required: true
  attr :label, :string, default: "Dropdown"
  attr :class, :string, default: ""

  attr :button_class, :string,
    default:
      "text-gray-300 bg-gray-800 hover:bg-gray-700 focus:ring-4 focus:outline-none focus:ring-gray-900 font-medium rounded-lg text-sm px-5 py-2.5 text-center inline-flex items-center dark:text-gray-900 dark:bg-gray-300 dark:hover:bg-gray-400 dark:focus:ring-gray-200"

  attr :items, :list,
    default: [
      %{label: "Dashboard", href: "#"},
      %{label: "Settings", href: "#"},
      %{label: "Earnings", href: "#"},
      %{label: "Sign out", href: "#"}
    ]

  def dropdown(assigns) do
    ~H"""
    <div id={@id <> "-wrapper"} class={"relative inline-block text-left #{@class}"}>
      <button
        id={@id <> "-button"}
        type="button"
        class={@button_class}
        phx-hook="DropdownToggle"
        data-target={@id}
        aria-haspopup="true"
        aria-expanded="false"
      >
        {@label}
        <svg
          class="w-2.5 h-2.5 ms-3"
          aria-hidden="true"
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 10 6"
        >
          <path
            stroke="currentColor"
            stroke-linecap="round"
            stroke-linejoin="round"
            stroke-width="2"
            d="m1 1 4 4 4-4"
          />
        </svg>
      </button>

      <div
        id={@id}
        class="absolute right-0 z-10 mt-2 w-44 origin-top-right transform transition-all duration-200 ease-out bg-white divide-y divide-gray-100 rounded-lg shadow-sm dark:bg-gray-700 hidden"
        aria-hidden="true"
      >
        <ul
          class="py-2 text-sm text-gray-300 dark:text-gray-900 bg-gray-800 dark:bg-gray-300"
          aria-labelledby={@id <> "-button"}
        >
          <%= for item <- @items do %>
            <li>
              <%= cond do %>
                <% item[:method] -> %>
                  <.link
                    href={item[:href]}
                    method={item.method}
                    class="block px-4 py-2 hover:bg-gray-700 dark:hover:bg-gray-400"
                  >
                    {item.label}
                  </.link>
                <% item[:phx_click] -> %>
                  <button
                    phx-click={item.phx_click}
                    class="block w-full text-left px-4 py-2 hover:bg-gray-700 dark:hover:bg-gray-400"
                  >
                    {item.label}
                  </button>
                <% true -> %>
                  <.link
                    href={item[:href]}
                    class="block px-4 py-2 hover:bg-gray-700 dark:hover:bg-gray-400"
                  >
                    {item.label}
                  </.link>
              <% end %>
            </li>
          <% end %>
        </ul>
      </div>
    </div>
    """
  end
end
