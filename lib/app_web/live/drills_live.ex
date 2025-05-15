defmodule AppWeb.DrillsLive do
  use AppWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <div class="flex flex-col items-center justify-center w-full h-full p-4">
      <h1 class="text-center text-4xl font-bold mb-6 text-gray-900 dark:text-white">{gettext("Drills")}</h1>
      <p class="text-lg text-gray-900 mb-8 dark:text-white text-center max-w-3xl">
        {gettext(
          "This page is intended for moderate to advanced players to elevate their game. If you are looking for more beginner friendly content, check out the Tutorials page!"
        )}
      </p>
      <!-- First Video -->
      <div class="mt-4 space-y-10 bg-gray-100 p-6 rounded-lg shadow-md dark:bg-gray-700 dark:text-white">
        <div>
          <h2 class="text-4xl font-semibold mb-2 dark:text-white">
            {gettext("13 Balls Half Square")}
          </h2>
          <p class="text-gray-900 mb-4 dark:text-white">
            {gettext(
              "This is a medium level drill. Remember if you cannot complete it simply mark your best score and try to beat it every time you practice it!"
            )}
          </p>
          <div class="w-full max-w-4xl" style="position: relative; padding-bottom: 56.25%; height: 0;">
            <iframe
              width="100%"
              height="315"
              src="https://www.youtube.com/embed/z_6XQR0sobQ?si=sJqI-S1FLXraQEYv"
              title="YouTube video player"
              style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"
              frameborder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
              referrerpolicy="strict-origin-when-cross-origin"
              allowfullscreen
            >
            </iframe>
          </div>
        </div>
        <!-- Second Video -->
        <div>
          <h2 class="text-4xl font-semibold mb-2 dark:text-white">
            {gettext("Top 10 Aim, Alignment, and Stroke Drills")}
          </h2>
          <p class="text-gray-900 mb-4 dark:text-white">
            {gettext(
              "Dr. Dave demonstrates the Top 10 most useful drills to test and improve your aim, alignment, and stroke."
            )}
          </p>
          <div class="w-full max-w-4xl" style="position: relative; padding-bottom: 56.25%; height: 0;">
            <iframe
              width="100%"
              height="315"
              src="https://www.youtube.com/embed/D3oj9lte_5o?si=NzIlFXoku1vCsmVr"
              title="YouTube video player"
              style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"
              frameborder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
              referrerpolicy="strict-origin-when-cross-origin"
              allowfullscreen
            >
            </iframe>
          </div>
        </div>
        <!-- Third Video -->
        <div>
          <h2 class="text-4xl font-semibold mb-2 dark:text-white">
            {gettext("Pool Drills Playlist")}
          </h2>
          <p class="text-gray-900 mb-4 dark:text-white">
            {gettext(
              "Something that you have learned has to be practiced until you can do it automatically. This playlists offers some useful drills that will improve certain parts of your game."
            )}
          </p>
          <div class="w-full max-w-4xl" style="position: relative; padding-bottom: 56.25%; height: 0;">
            <iframe
              width="100%"
              height="315"
              src="https://www.youtube.com/embed/videoseries?si=FAtDnPZbfyYJ-lc_&amp;list=PLoI6SfoHAoCex8jHpvmI-6w2vyv_Y-cUP"
              title="YouTube video player"
              style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"
              frameborder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
              referrerpolicy="strict-origin-when-cross-origin"
              allowfullscreen
            >
            </iframe>
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
