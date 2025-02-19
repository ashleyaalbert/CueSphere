defmodule AppWeb.Components.UI.Navbar do
  use Phoenix.Component

  alias Phoenix.LiveView.JS

  @doc """
  Renders a navbar.

  ## Examples

      <.navbar />

  """

  def navbar(assigns) do
    ~H"""
    <nav class="bg-border-gray-800 dark:bg-gray-300">
      <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
        <button
          id="menu-button"
          type="button"
          class="inline-flex items-center p-2 w-10 h-10 justify-center text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 transition-all focus:outline-none dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-0" aria-controls="menu"
          aria-expanded="false"
          phx-click={toggle_menu()}>
          <span class="sr-only">Open main menu</span>
            <svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 17 14">
              <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 1h15M1 7h15M1 13h15"/>
            </svg>
        </button>
          <div class="hidden w-full md:block md:w-auto bg-gray-900 dark:bg-gray-200 rounded-lg p-2 md:p-0 mt-4 md:mt-0" id="menu" phx-click-away={close_menu()}>
            <ol class="font-medium flex flex-col p-4 md:p-0 mt-4 border-0 rounded-lg md:flex-row md:space-x-8 rtl:space-x-reverse md:mt-0 md:border-0 text-gray-300 dark:text-gray-900">
            <li>
              <.link href="/" class="block px-4 py-2 text-gray-300 rounded-md hover:bg-gray-700 hover:text-white dark:text-gray-900 dark:hover:bg-gray-400 dark:hover:text-black transition-all" aria-current="page">Home</.link>
            </li>
            <li>
              <.link href="/planets" class="block px-4 py-2 text-gray-300 rounded-md hover:bg-gray-700 hover:text-white dark:text-gray-900 dark:hover:bg-gray-400 dark:hover:text-black transition-all">Planets</.link>
            </li>
            <li>
              <.link href="/live/planets" class="block px-4 py-2 text-gray-300 rounded-md hover:bg-gray-700 hover:text-white dark:text-gray-900 dark:hover:bg-gray-400 dark:hover:text-black transition-all">Planets Live</.link>
            </li>
            <li>
              <.link href="/courses" class="block px-4 py-2 text-gray-300 rounded-md hover:bg-gray-700 hover:text-white dark:text-gray-900 dark:hover:bg-gray-400 dark:hover:text-black transition-all">Courses</.link>
            </li>
            <li>
              <.link href="/messages" class="block px-4 py-2 text-gray-300 rounded-md hover:bg-gray-700 hover:text-white dark:text-gray-900 dark:hover:bg-gray-400 dark:hover:text-black transition-all">Messages</.link>
            </li>
            <li>
              <button
                type="button"
                phx-click={AppWeb.Components.UI.Modal.open_modal()}
                class="block px-4 py-2 text-gray-300 rounded-md hover:bg-gray-700 hover:text-white dark:text-gray-900 dark:hover:bg-gray-400 dark:hover:text-black transition-all"
              >
                Contact Us
              </button>
            </li>

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

  defp close_menu do
    %JS{}
    |> JS.add_class("hidden", to: "#menu")
    |> JS.set_attribute({"aria-expanded", "false"}, to: "#menu-button")
  end

end
