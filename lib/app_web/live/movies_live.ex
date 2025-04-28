defmodule AppWeb.MoviesLive do
  use AppWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <div class="mt-8 bg-white shadow-lg rounded-xl p-6 md:p-10 dark:bg-gray-800 dark:text-gray-200">
      <h2 class="text-2xl font-semibold text-center text-gray-700 dark:text-white">
        {gettext("Recommended Billiard Movies")}
      </h2>
      <div class="mt-6 grid grid-cols-1 gap-6">
        <!-- Movie 1 -->
        <div class="flex items-start space-x-4 bg-gray-200 p-4 rounded-lg dark:bg-gray-700">
          <img src={~p"/images/movie1.jpg"} alt="The Hustler Movie Poster" class="w-24 h-32 object-cover rounded-md shadow" />
          <div>
            <h3 class="text-lg font-semibold text-blue-900 dark:text-white">The Hustler</h3>
            <p class="text-sm text-gray-800 dark:text-gray-300 mb-2">
            Directed by Robert Rossen. Hollywood icon Paul Newman stars in this all-time classic about an up-and-coming pool player, “Fast Eddie” Felson, who risks it all in a match with pool champion “Minnesota Fats,” played by Jackie Gleason.
            </p>
            <a href="https://watch.sling.com/1/program/0fe256933f3ed6afb92ee17b969bab48/watch?trackingid=google-feed" target="_blank"
              class="inline-block px-3 py-1 bg-blue-600 text-white text-sm rounded hover:bg-blue-700 transition">
              Watch Now Free
            </a>
            <.tag color="red">Not Rated</.tag>
          </div>
        </div>

        <!-- Movie 2 -->
        <div class="flex items-start space-x-4 bg-gray-200 p-4 rounded-lg dark:bg-gray-700">
          <img src={~p"/images/movie2.jpg"} alt="The Color of Money Movie Poster" class="w-24 h-32 object-cover rounded-md shadow" />
          <div>
            <h3 class="text-lg font-semibold text-blue-900 dark:text-white">The Color of Money</h3>
            <p class="text-sm text-gray-800 dark:text-gray-300 mb-2">Directed by Martin Scorsese. Former pool hustler "Fast Eddie" Felson (Paul Newman) decides he wants to return to the game by taking a pupil. He meets talented but green Vincent Lauria (Tom Cruise) and proposes a partnership. As they tour pool halls, Eddie teaches Vincent the tricks of scamming, but he eventually grows frustrated with Vincent's showboat antics, leading to an argument and a falling-out. Eddie takes up playing again and soon crosses paths with Vincent as an opponent.
           </p>
            <a href="https://www.youtube.com/watch?v=nNeTb11wRmw" target="_blank"
              class="inline-block px-3 py-1 bg-blue-600 text-white text-sm rounded hover:bg-blue-700 transition">
              Watch Now $3.99
            </a>
            <.tag color="red">Rated R</.tag>
          </div>
        </div>

        <!-- Movie 3 -->
        <div class="flex items-start space-x-4 bg-gray-200 p-4 rounded-lg dark:bg-gray-700">
          <img src={~p"/images/movie3.jpg"} alt="Poolhall Junkies Movie Poster" class="w-24 h-32 object-cover rounded-md shadow" />
          <div>
            <h3 class="text-lg font-semibold text-blue-900 dark:text-white">Poolhall Junkies</h3>
            <p class="text-sm text-gray-800 dark:text-gray-300 mb-2">
            Directed by Mars Callahan. A talented pool hustler who has stayed out of the game for years must return to his old ways when his little brother gets involved with his enemy--the very man who held him back from greatness.
            </p>
            <a href="https://watch.sling.com/1/program/8a28f075fa45de0cb83f4982c0ef8231/watch?trackingid=google-feed" target="_blank"
              class="inline-block px-3 py-1 bg-blue-600 text-white text-sm rounded hover:bg-blue-700 transition">
              Watch Now Free
            </a>
            <.tag color="red">Rated R</.tag>
          </div>
        </div>

        <!-- Movie 4 -->
        <div class="flex items-start space-x-4 bg-gray-200 p-4 rounded-lg dark:bg-gray-700">
          <img src={~p"/images/movie4.jpg"} alt="Stickmen Movie Poster" class="w-24 h-32 object-cover rounded-md shadow" />
          <div>
            <h3 class="text-lg font-semibold text-blue-900 dark:text-white">Stickmen</h3>
            <p class="text-sm text-gray-800 dark:text-gray-300 mb-2">
              Directed by Hamish Rothwell. Three friends tour the Wellington pub scene, playing pool with ever-increasing stakes. Then they enter a tournament run by vicious crime boss 'Daddy'. Narrator Kirk Torrance (Outrageous Fortune) guides us through their mission to pocket the money. This movie is unavailable to watch online.
            </p>
            <.tag color="red">Rated R</.tag>
          </div>
        </div>
      </div>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
