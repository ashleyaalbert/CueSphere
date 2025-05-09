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
            <path
              stroke="currentColor"
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M1 1h15M1 7h15M1 13h15"
            />
          </svg>
        </button>

        <div id="menu" class="hidden w-full md:flex md:items-center">
          <ol class="flex flex-col md:flex-row md:space-x-8 text-gray-300 dark:text-gray-900">
            <.dropdown
              id="generalDropdown"
              label="General"
              items={[
                %{label: "Home", href: ~p"/"},
                %{label: "About", href: ~p"/about"},
                %{label: "Facts", href: ~p"/facts"},
                %{label: "Fargo Rate", href: ~p"/fargo-rate"},
                %{label: "Purchase", href: ~p"/purchase"}
              ]}
            />

            <.dropdown
              id="learnDropdown"
              label="Learn"
              items={[
                %{label: "Tutorials", href: ~p"/tutorials"},
                %{label: "Drills", href: ~p"/drills"},
                %{label: "Books", href: ~p"/books"},
                %{label: "Movies", href: ~p"/movies"}
              ]}
            />

            <.dropdown
              id="playDropdown"
              label="Play"
              items={[
                %{label: "Rules", href: ~p"/rules"},
                %{label: "Games", href: ~p"/games"},
                %{label: "Leagues", href: ~p"/leagues"},
                %{label: "Tournaments", href: ~p"/tournaments"}
              ]}
            />

            <.dropdown
              id="contactDropdown"
              label="Contact Us"
              items={[
                %{label: "Messages", href: ~p"/messages"},
                %{label: "Contact Form", phx_click: Modal.show_modal("contact-modal")}
              ]}
            />

            <%= if @user_id do %>
              <.dropdown
                id="inDropdown"
                label={@user_id.email}
                items={[
                  %{label: "Settings", href: ~p"/users/settings"},
                  %{
                    label: "Log out",
                    href: ~p"/users/log_out",
                    method: "DELETE",
                    phx_hook: "LogoutButton"
                  }
                ]}
              />
            <% else %>
              <.dropdown
                id="outDropdown"
                label="Log in"
                items={[
                  %{label: "Log in", href: ~p"/users/log_in"},
                  %{label: "Register", href: ~p"/users/register"}
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
