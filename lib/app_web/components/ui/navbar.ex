defmodule AppWeb.Components.UI.Navbar do
  use Phoenix.Component
  use Gettext, backend: AppWeb.Gettext

  use Phoenix.VerifiedRoutes,
    endpoint: AppWeb.Endpoint,
    router: AppWeb.Router,
    statics: AppWeb.static_paths()

  alias Phoenix.LiveView.JS
  import Phoenix.LiveView
  alias AppWeb.Components.UI.Modal
  import AppWeb.Components.UI.Dropdowns

  @doc """
  Renders a navbar.

  ## Examples

      <.navbar />

  """

  def navbar(assigns) do
    ~H"""
    <nav class="bg-gray-800 dark:bg-gray-300">
      <div class="container mx-auto p-2">

        <!-- Mobile Menu Button -->
        <button
          id="menu-button"
          type="button"
          class="lg:hidden p-2 w-10 h-10 text-gray-500 rounded-lg hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700"
          aria-controls="menu"
          aria-expanded="false"
          phx-click={toggle_menu()}
          tabindex="1"
        >
          <span class="sr-only">Open main menu</span>
          <svg class="w-5 h-5" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 17 14">
            <path
              stroke="currentColor"
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M1 1h15M1 7h15M1 13h15"
            />
          </svg>
        </button>

        <div id="menu" class="hidden w-full lg:flex lg:items-center transition-all duration-300 ease-in-out">
          <ol class="flex flex-col lg:flex-row lg:space-x-8 text-gray-300 dark:text-gray-900">
            <.dropdown
              id="generalDropdown"
              label={gettext("General")}
              items={[
                %{label: gettext("Home"), href: ~p"/"},
                %{label: gettext("About"), href: ~p"/about"},
                %{label: gettext("Facts"), href: ~p"/facts"},
                %{label: gettext("Fargo Rate"), href: ~p"/fargo-rate"},
                %{label: gettext("Purchase"), href: ~p"/purchase"}
              ]}
            />

            <.dropdown
              id="learnDropdown"
              label={gettext("Learn")}
              items={[
                %{label: gettext("Tutorials"), href: ~p"/tutorials"},
                %{label: gettext("Drills"), href: ~p"/drills"},
                %{label: gettext("Books"), href: ~p"/books"},
                %{label: gettext("Movies"), href: ~p"/movies"}
              ]}
            />

            <.dropdown
              id="playDropdown"
              label={gettext("Play")}
              items={[
                %{label: gettext("Rules"), href: ~p"/rules"},
                %{label: gettext("Games"), href: ~p"/games"},
                %{label: gettext("Leagues"), href: ~p"/leagues"},
                %{label: gettext("Tournaments"), href: ~p"/tournaments"}
              ]}
            />

            <.dropdown
              id="contactDropdown"
              label={gettext("Contact Us")}
              items={[
                %{label: gettext("Messages"), href: ~p"/messages"},
                %{label: gettext("Contact Us Form"), phx_click: Modal.show_modal("contact-modal")}
              ]}
            />

            <%= if @user_id do %>
              <.dropdown
                id="inDropdown"
                label={@user_id.email}
                items={[
                  %{label: gettext("Settings"), href: ~p"/users/settings"},
                  %{
                    label: gettext("Log out"),
                    href: ~p"/users/log_out",
                    method: "DELETE",
                    phx_hook: "LogoutButton"
                  }
                ]}
              />
            <% else %>
              <.dropdown
                id="outDropdown"
                label={gettext("Log in")}
                items={[
                  %{label: gettext("Log in"), href: ~p"/users/log_in"},
                  %{label: gettext("Register"), href: ~p"/users/register"}
                ]}
              />
            <% end %>
          </ol>
        </div>
      </div>
    </nav>
    """
  end

  defp toggle_menu do
    %JS{}
    # |> JS.toggle_class("translate-x-full", to: "#menu")
    |> JS.toggle_class("translate-x-0", to: "#menu")
    |> JS.toggle_class("hidden", to: "#menu")
    |> JS.toggle_attribute({"aria-expanded", "true", "false"}, to: "#menu-button")
  end

  def handle_event("delete", %{"href" => href}, socket) do
    # Assuming you're logging out the user here
    if href == "/users/log_out" do
      # Log the user out
      {:noreply, push_navigate(socket, to: "/")}
    else
      {:noreply, socket}
    end
  end
end
