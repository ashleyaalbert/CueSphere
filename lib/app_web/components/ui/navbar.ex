defmodule AppWeb.Components.UI.Navbar do
  use Phoenix.Component
  use Gettext, backend: AppWeb.Gettext

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
        tabindex="1"
      >
        <span class="sr-only">Open main menu</span>
        <svg class="w-5 h-5" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 17 14">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 1h15M1 7h15M1 13h15" />
        </svg>
      </button>

      <div id="menu" class="hidden w-full md:flex md:items-center">
        <ol class="flex flex-col md:flex-row md:space-x-8 text-gray-300 dark:text-gray-900">

          <li class="relative group">
            <.link href={~p"/"} tabindex="1" class="px-4 py-2 block hover:bg-gray-700 dark:hover:bg-gray-400 rounded-md transition-all">{gettext("General")}</.link>
            <ul class="hidden group-hover:block group-hover:delay-150 md:absolute md:left-0 md:bg-gray-800 md:dark:bg-gray-300 md:mt-1 md:w-44 md:rounded-md md:shadow-lg md:border md:border-gray-700 md:dark:border-gray-400
              md:p-0 p-2 bg-gray-900 dark:bg-gray-200 rounded-md md:shadow-none">
              <li><.link href={~p"/about"} tabindex="3" class="block px-4 py-2 hover:bg-gray-700 dark:hover:bg-gray-400">{gettext("About")}</.link></li>
              <li><.link href={~p"/facts"} tabindex="3" class="block px-4 py-2 hover:bg-gray-700 dark:hover:bg-gray-400">{gettext("Facts")}</.link></li>
              <li><.link href={~p"/fargo-rate"} tabindex="3" class="block px-4 py-2 hover:bg-gray-700 dark:hover:bg-gray-400">{gettext("Fargo Rate")}</.link></li>
              <li><.link href={~p"/purchase"} tabindex="3" class="block px-4 py-2 hover:bg-gray-700 dark:hover:bg-gray-400">{gettext("Purchase")}</.link></li>
            </ul>
          </li>

          <li class="relative group">
            <.link tabindex="4" class="px-4 py-2 block hover:bg-gray-700 dark:hover:bg-gray-400 rounded-md transition-all">{gettext("Learn")}</.link>
            <ul class="hidden group-hover:block group-hover:delay-150 md:absolute md:left-0 md:bg-gray-800 md:dark:bg-gray-300 md:mt-1 md:w-44 md:rounded-md md:shadow-lg md:border md:border-gray-700 md:dark:border-gray-400
              md:p-0 p-2 bg-gray-900 dark:bg-gray-200 rounded-md md:shadow-none">
              <li><.link href={~p"/tutorials"} tabindex="5" class="block px-4 py-2 hover:bg-gray-700 dark:hover:bg-gray-400">{gettext("Tutorials")}</.link></li>
              <li><.link href={~p"/drills"} tabindex="5" class="block px-4 py-2 hover:bg-gray-700 dark:hover:bg-gray-400">{gettext("Drills")}</.link></li>
              <li><.link href={~p"/books"} tabindex="5" class="block px-4 py-2 hover:bg-gray-700 dark:hover:bg-gray-400">{gettext("Books")}</.link></li>
              <li><.link href={~p"/movies"} tabindex="5" class="block px-4 py-2 hover:bg-gray-700 dark:hover:bg-gray-400">{gettext("Movies")}</.link></li>
            </ul>
          </li>

          <li class="relative group">
            <.link tabindex="4" class="px-4 py-2 block hover:bg-gray-700 dark:hover:bg-gray-400 rounded-md transition-all">{gettext("Play")}</.link>
            <ul class="hidden group-hover:block group-hover:delay-150 md:absolute md:left-0 md:bg-gray-800 md:dark:bg-gray-300 md:mt-1 md:w-44 md:rounded-md md:shadow-lg md:border md:border-gray-700 md:dark:border-gray-400
              md:p-0 p-2 bg-gray-900 dark:bg-gray-200 rounded-md md:shadow-none">
              <li><.link href={~p"/rules"} tabindex="5" class="block px-4 py-2 hover:bg-gray-700 dark:hover:bg-gray-400">{gettext("Rules")}</.link></li>
              <li><.link href={~p"/games"} tabindex="5" class="block px-4 py-2 hover:bg-gray-700 dark:hover:bg-gray-400">{gettext("Games")}</.link></li>
              <li><.link href={~p"/leagues"} tabindex="5" class="block px-4 py-2 hover:bg-gray-700 dark:hover:bg-gray-400">{gettext("Leagues")}</.link></li>
              <li><.link href={~p"/tournaments"} tabindex="5" class="block px-4 py-2 hover:bg-gray-700 dark:hover:bg-gray-400">{gettext("Tournaments")}</.link></li>
            </ul>
          </li>

          <li class="relative group">
            <button
              type="button"
              phx-click={Modal.show_modal("contact-modal")}
              class="px-4 py-2 block hover:bg-gray-700 dark:hover:bg-gray-400 rounded-md transition-all"
              tabindex="6"
            >
              {gettext("Contact Us")}
            </button>
            <ul class="hidden group-hover:block group-hover:delay-150 md:absolute md:left-0 md:bg-gray-800 md:dark:bg-gray-300 md:mt-1 md:w-44 md:rounded-md md:shadow-lg md:border md:border-gray-700 md:dark:border-gray-400
              md:p-0 p-2 bg-gray-900 dark:bg-gray-200 rounded-md md:shadow-none">
              <li><.link href={~p"/messages"} tabindex="7" class="block px-4 py-2 hover:bg-gray-700 dark:hover:bg-gray-400">{gettext("Messages")}</.link></li>
              <li><.link href={~p"/topics"} tabindex="8" class="block px-4 py-2 hover:bg-gray-700 dark:hover:bg-gray-400">{gettext("Topics")}</.link></li>
              <li><.link href={~p"/chat"} tabindex="9" class="block px-4 py-2 hover:bg-gray-700 dark:hover:bg-gray-400">{gettext("Chat")}</.link></li>
            </ul>
          </li>

          <%= if @current_user do %>
            <li class="relative group">
              <.link href="#" class="px-4 py-2 block hover:bg-gray-700 dark:hover:bg-gray-400 rounded-md transition-all">
                <%= @current_user.email %>
              </.link>
              <ul class="hidden group-hover:block group-hover:delay-150 md:absolute md:left-0 md:bg-gray-800 md:dark:bg-gray-300 md:mt-1 md:w-44 md:rounded-md md:shadow-lg md:border md:border-gray-700 md:dark:border-gray-400
                md:p-0 p-2 bg-gray-900 dark:bg-gray-200 rounded-md md:shadow-none">
                <li><.link tabindex="10" href={~p"/users/settings"} class="block px-4 py-2 hover:bg-gray-700 dark:hover:bg-gray-400">{gettext("Settings")}</.link></li>
                <li><.link id="logout-button" tabindex="11" href={~p"/users/log_out"} method="DELETE" phx-hook="LogoutButton" class="block px-4 py-2 hover:bg-gray-700 dark:hover:bg-gray-400">{gettext("Log out")}</.link></li>
              </ul>
            </li>
          <% else %>
            <li class="relative group">
              <.link href={~p"/users/log_in"} tabindex="10" class="px-4 py-2 block hover:bg-gray-700 dark:hover:bg-gray-400 rounded-md transition-all">{gettext("Log in")}</.link>
              <ul class="hidden group-hover:block group-hover:delay-150 md:absolute md:left-0 md:bg-gray-800 md:dark:bg-gray-300 md:mt-1 md:w-44 md:rounded-md md:shadow-lg md:border md:border-gray-700 md:dark:border-gray-400
                md:p-0 p-2 bg-gray-900 dark:bg-gray-200 rounded-md md:shadow-none">
                <li><.link href={~p"/users/register"} tabindex="11" class="block px-4 py-2 hover:bg-gray-700 dark:hover:bg-gray-400">{gettext("Register")}</.link></li>
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
end
