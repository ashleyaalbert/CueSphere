defmodule AppWeb.Components.UI.Navbar do
  use Phoenix.Component

  use Phoenix.VerifiedRoutes,
    endpoint: AppWeb.Endpoint,
    router: AppWeb.Router,
    statics: AppWeb.static_paths()

  alias Phoenix.LiveView.JS
  alias AppWeb.Components.UI.Modal

  @doc """
  Renders a navbar.

  ## Examples

      <.navbar />

  """

  def navbar(assigns) do
    ~H"""
  <nav class="bg-gray-800 dark:bg-gray-300">
    <div class="max-w-screen-xl flex items-center justify-between mx-auto p-4">

      <!-- Mobile Menu Button -->
      <button
        id="menu-button"
        type="button"
        class="md:hidden p-2 w-10 h-10 text-gray-500 rounded-lg hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700"
        aria-controls="menu"
        aria-expanded="false"
        phx-click={toggle_menu()}
      >
        <span class="sr-only">Open main menu</span>
        <svg class="w-5 h-5" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 17 14">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 1h15M1 7h15M1 13h15" />
        </svg>
      </button>

      <!-- Navigation Links -->
      <div id="menu" class="hidden w-full md:flex md:items-center">
        <ol class="flex flex-col md:flex-row md:space-x-8 text-gray-300 dark:text-gray-900">

          <!-- Home Dropdown -->
          <li class="relative group">
            <.link href={~p"/"} class="px-4 py-2 block hover:bg-gray-700 dark:hover:bg-gray-400 rounded-md transition-all">Home</.link>
            <ul class="hidden group-hover:block group-hover:delay-150 md:absolute md:left-0 md:bg-gray-800 md:dark:bg-gray-300 md:mt-1 md:w-44 md:rounded-md md:shadow-lg md:border md:border-gray-700 md:dark:border-gray-400
              md:p-0 p-2 bg-gray-900 dark:bg-gray-200 rounded-md md:shadow-none">
              <li><.link href={~p"/courses"} class="block px-4 py-2 hover:bg-gray-700 dark:hover:bg-gray-400">Courses</.link></li>
              <li><.link href={~p"/facemash"} class="block px-4 py-2 hover:bg-gray-700 dark:hover:bg-gray-400">Destinations</.link></li>
            </ul>
          </li>

          <!-- Planets Dropdown -->
          <li class="relative group">
            <.link href={~p"/planets"} class="px-4 py-2 block hover:bg-gray-700 dark:hover:bg-gray-400 rounded-md transition-all">Planets</.link>
            <ul class="hidden group-hover:block group-hover:delay-150 md:absolute md:left-0 md:bg-gray-800 md:dark:bg-gray-300 md:mt-1 md:w-44 md:rounded-md md:shadow-lg md:border md:border-gray-700 md:dark:border-gray-400
              md:p-0 p-2 bg-gray-900 dark:bg-gray-200 rounded-md md:shadow-none">
              <li><.link href={~p"/live/planets"} class="block px-4 py-2 hover:bg-gray-700 dark:hover:bg-gray-400">Planets Live</.link></li>
            </ul>
          </li>

          <!-- Contact Us Dropdown -->
          <li class="relative group">
            <button
              type="button"
              phx-click={Modal.show_modal("contact-modal")}
              class="px-4 py-2 block hover:bg-gray-700 dark:hover:bg-gray-400 rounded-md transition-all"
            >
              Contact Us
            </button>
            <ul class="hidden group-hover:block group-hover:delay-150 md:absolute md:left-0 md:bg-gray-800 md:dark:bg-gray-300 md:mt-1 md:w-44 md:rounded-md md:shadow-lg md:border md:border-gray-700 md:dark:border-gray-400
              md:p-0 p-2 bg-gray-900 dark:bg-gray-200 rounded-md md:shadow-none">
              <li><.link href={~p"/messages"} class="block px-4 py-2 hover:bg-gray-700 dark:hover:bg-gray-400">Messages</.link></li>
              <li><.link href={~p"/topics"} class="block px-4 py-2 hover:bg-gray-700 dark:hover:bg-gray-400">Topics</.link></li>
              <li><.link href={~p"/chat"} class="block px-4 py-2 hover:bg-gray-700 dark:hover:bg-gray-400">Chat</.link></li>
            </ul>
          </li>

          <!-- User Authentication Dropdown -->
          <%= if @current_user do %>
            <li class="relative group">
              <.link href="#" class="px-4 py-2 block hover:bg-gray-700 dark:hover:bg-gray-400 rounded-md transition-all">
                <%= @current_user.email %>
              </.link>
              <ul class="hidden group-hover:block group-hover:delay-150 md:absolute md:left-0 md:bg-gray-800 md:dark:bg-gray-300 md:mt-1 md:w-44 md:rounded-md md:shadow-lg md:border md:border-gray-700 md:dark:border-gray-400
                md:p-0 p-2 bg-gray-900 dark:bg-gray-200 rounded-md md:shadow-none">
                <li><.link href={~p"/users/settings"} class="block px-4 py-2 hover:bg-gray-700 dark:hover:bg-gray-400">Settings</.link></li>
                <li><.link id="logout-button" href={~p"/users/log_out"} method="DELETE" phx-hook="LogoutButton" class="block px-4 py-2 hover:bg-gray-700 dark:hover:bg-gray-400">Log out</.link></li>
              </ul>
            </li>
          <% else %>
            <li class="relative group">
              <.link href={~p"/users/log_in"} class="px-4 py-2 block hover:bg-gray-700 dark:hover:bg-gray-400 rounded-md transition-all">Log in</.link>
              <ul class="hidden group-hover:block group-hover:delay-150 md:absolute md:left-0 md:bg-gray-800 md:dark:bg-gray-300 md:mt-1 md:w-44 md:rounded-md md:shadow-lg md:border md:border-gray-700 md:dark:border-gray-400
                md:p-0 p-2 bg-gray-900 dark:bg-gray-200 rounded-md md:shadow-none">
                <li><.link href={~p"/users/register"} class="block px-4 py-2 hover:bg-gray-700 dark:hover:bg-gray-400">Register</.link></li>
              </ul>
            </li>
          <% end %>

        </ol>
      </div>
    </div>
  </nav>
  """
  end

  defp toggle_menu do
    %JS{}
    |> JS.toggle_class("hidden", to: "#menu")
    |> JS.toggle_attribute({"aria-expanded", "true", "false"}, to: "#menu-button")
  end

  # defp close_menu do
  #   %JS{}
  #   |> JS.add_class("hidden", to: "#menu")
  #   |> JS.set_attribute({"aria-expanded", "false"}, to: "#menu-button")
  # end
end
