defmodule AppWeb.Components.UI.Footer do
  use Phoenix.Component

  # import AppWeb.Components.UI.Footer
  # <.footer year={2025} brand="MyApp" brand_link="/" links={[
  #   %{label: "Docs", href: "/about"},
  #   %{label: "Terms", href: "/about"},
  #   %{label: "Support", href: "/about"}
  # ]} />

  attr :year, :integer, default: 2023
  attr :brand, :string, default: "Flowbite™"
  attr :brand_link, :string, default: "https://flowbite.com"
  attr :links, :list, default: [
    %{label: "About", href: "#"},
    %{label: "Privacy Policy", href: "#"},
    %{label: "Licensing", href: "#"},
    %{label: "Contact", href: "#"}
  ]

  def footer(assigns) do
    ~H"""
    <footer class="bg-gray-800 dark:bg-gray-300 text-white w-full mt-auto">
      <div class="max-w-screen-xl mx-auto p-4 md:flex md:items-center md:justify-between">
        <span class="text-sm text-gray-300 sm:text-center dark:text-gray-600">
          © <%= @year %>
          <a href={@brand_link} class="hover:underline"><%= @brand %></a>. All Rights Reserved.
        </span>
        <ul class="flex flex-wrap items-center mt-3 text-sm font-medium text-gray-300 dark:text-gray-600 sm:mt-0">
          <%= for link <- @links do %>
            <li>
              <a href={link.href} class="hover:underline me-4 md:me-6"><%= link.label %></a>
            </li>
          <% end %>
        </ul>
      </div>
    </footer>
    """
  end
end
