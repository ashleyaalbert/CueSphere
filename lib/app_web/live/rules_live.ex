defmodule AppWeb.RulesLive do
  use AppWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-10">
      <h1 class="text-4xl font-bold text-center text-gray-700 dark:text-white">{gettext("League Rules")}</h1>

      <div class="mt-8 bg-white shadow-lg rounded-xl p-6 md:p-10 dark:bg-gray-800 dark:text-gray-200">
        <%= for league <- @leagues do %>
          <section id={league.name} class="mb-10">
            <div class="flex flex-col md:flex-row items-start md:items-center gap-4">
              <!-- Text Content -->
              <div class="flex-1">
                <h2 class="text-2xl py-2 font-semibold mb-4 text-gray-900 dark:text-white">
                  {league.name}
                </h2>
                <ul class="list-disc list-inside space-y-2 text-gray-900 dark:text-white">
                  <%= for rule <- league.rules do %>
                    <li>{rule}</li>
                  <% end %>
                </ul>
              </div>

              <!-- Logo -->
              <div class="w-full md:w-52 -ml-4 flex-shrink-0">
                <img
                  src={league.logo_url}
                  alt={"#{league.name} logo"}
                  class="w-full h-auto rounded-lg shadow-md object-contain"
                />
              </div>
            </div>
          </section>
        <% end %>
      </div>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    leagues = [
      %{
        name: "APA",
        rules: [gettext("Race to points based on skill level"), gettext("No coaching during the game")],
        logo_url: ~p"/images/final/apa.jpg"
      },
      %{
        name: "TAP",
        rules: [gettext("Call pocket for all shots"), gettext("No handicap system used")],
        logo_url: ~p"/images/final/tap.png"
      },
      %{
        name: "BCA",
        rules: [gettext("Ball-in-hand fouls"), gettext("Alternate breaks")],
        logo_url: ~p"/images/final/bca.png"
      },
      %{
        name: "VNEA",
        rules: [gettext("Time limits per shot"), gettext("3 foul rule in effect")],
        logo_url: ~p"/images/final/vnea.png"
      },
      %{
        name: "UPA",
        rules: [gettext("Matches are played in sets"), gettext("Lag for break")],
        logo_url: ~p"/images/final/upa.png"
      }
    ]

    {:ok, assign(socket, leagues: leagues)}
  end
end
