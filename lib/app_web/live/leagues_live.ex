defmodule AppWeb.LeaguesLive do
  use AppWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="flex flex-col items-center justify-center w-full h-full p-4">
      <h1 class="text-center text-4xl font-bold mb-6 text-gray-900 dark:text-white">
        {gettext("Billiards Leagues")}
      </h1>
      <p class="text-lg text-gray-900 mb-8 dark:text-white text-center max-w-3xl">
        {gettext(
          "Explore popular billiards leagues like APA, TAP, BCA, and more. Each league has unique formats, rules, and competitive structures."
        )}
      </p>

      <div class="space-y-10 bg-gray-100 p-6 rounded-lg shadow-md dark:bg-gray-800 dark:text-white w-full max-w-4xl mx-auto mt-10">
        <%= for league <- @leagues do %>
          <div class="bg-gray-200 dark:bg-gray-700 p-6 rounded-xl shadow-md flex flex-col md:flex-row gap-6 items-start">
            <!-- Logo -->
            <div class="w-full md:w-28 flex-shrink-0">
              <img
                src={league.logo_url}
                alt={"#{league.name} logo"}
                class="w-full h-auto rounded-lg shadow object-contain bg-white dark:bg-gray-100 p-2"
              />
            </div>

            <!-- Text Content -->
            <div class="flex-1">
              <h2 class="text-2xl font-bold text-black dark:text-white mb-2">
                {league.name}
              </h2>
              <div class="mt-4 text-base text-black dark:text-gray-100 space-y-1">
                <p>
                  <span class="font-semibold text-gray-900 dark:text-white">{gettext("Games:")}</span>
                  {Enum.join(league.games, ", ")}
                </p>
                <p>
                  <a
                    href={league.website}
                    target="_blank"
                    class="text-lg font-medium hover:underline text-gray-900 dark:text-white"
                    aria-label={"Visit #{league.name} website"}
                  >
                    {gettext("Visit League Website")}
                  </a>
                </p>
              </div>
            </div>
          </div>
        <% end %>
      </div>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    leagues = [
      %{
        name: gettext("APA: The American Poolplayers Association"),
        logo_url: ~p"/images/final/apa.jpg",
        games: [gettext("8-Ball"), gettext("9-Ball")],
        website: "https://poolplayers.com"
      },
      %{
        name: gettext("TAP: The Association for Pool"),
        logo_url: ~p"/images/final/tap.png",
        games: [gettext("8-Ball"), gettext("9-Ball"), gettext("10-Ball")],
        website: "https://www.tapleague.com"
      },
      %{
        name: gettext("BCA: The Billiards Congress of America"),
        logo_url: ~p"/images/final/bca.png",
        games: [gettext("8-Ball"), gettext("9-Ball"), gettext("10-Ball")],
        website: "https://www.playbca.com"
      },
      %{
        name: gettext("VNEA: Valley National 8-Ball League Association"),
        logo_url: ~p"/images/final/vnea.png",
        games: [gettext("8-Ball"), gettext("9-Ball")],
        website: "https://www.vnea.com"
      },
      %{
        name: gettext("UPA: United States Professional Poolplayers Association"),
        logo_url: ~p"/images/final/upa.png",
        games: [gettext("8-Ball"), gettext("9-Ball"), gettext("10-Ball")],
        website: "https://www.upatour.com"
      }
    ]

    {:ok, assign(socket, leagues: leagues)}
  end
end
