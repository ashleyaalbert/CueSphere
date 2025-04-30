defmodule AppWeb.DrillsLive do
  use AppWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <div class="p-8">
      <h1 class="text-4xl font-bold mb-6 dark:text-white">Drills</h1>
      <p class="text-gray-700 mb-4 dark:text-white">
          This page is intended for moderate to advanced players to elevate their game. If you are looking for more beginner friendly content, check out the tutorials page!
          </p>
      <div class="space-y-10">
        <div>
          <h2 class="text-2xl font-semibold mb-2 dark:text-white">13 Balls Half Square</h2>
          <p class="text-gray-700 mb-4 dark:text-white">
          This is a medium level drill. Remember if you cannot complete it simply mark your best score and try to beat it every time you practice it!
          </p>
          <div class="w-full max-w-2xl">
            <iframe
              width="100%"
              height="315"
              src="https://www.youtube.com/embed/z_6XQR0sobQ?si=sJqI-S1FLXraQEYv"
              title="YouTube video player"
              frameborder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
              referrerpolicy="strict-origin-when-cross-origin"
              allowfullscreen>
            </iframe>
          </div>
        </div>

        <div>
          <h2 class="text-2xl font-semibold mb-2 dark:text-white">Top 10 Aim, Alignment, and Stroke Drills</h2>
          <p class="text-gray-700 mb-4 dark:text-white">
          Dr. Dave demonstrates the Top 10 most useful drills to test and improve your aim, alignment, and stroke.
          </p>
          <div class="w-full max-w-2xl">
            <iframe
              width="100%"
              height="315"
              src="https://www.youtube.com/embed/D3oj9lte_5o?si=NzIlFXoku1vCsmVr"
              title="YouTube video player"
              frameborder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
              referrerpolicy="strict-origin-when-cross-origin"
              allowfullscreen>
            </iframe>
          </div>
        </div>

        <div>
          <h2 class="text-2xl font-semibold mb-2 dark:text-white">
            Pool Drills Playlist
          </h2>
          <p class="text-gray-700 mb-4 dark:text-white">
            Something that you have learned has to be practiced until you can do it automatically. This playlists offers some useful drills that will improve certain parts of your game.
          </p>
          <div class="w-full max-w-4xl" style="position: relative; padding-bottom: 56.25%; height: 0;">
            <iframe
              width="100%"
              height="315"
              src="https://www.youtube.com/embed/videoseries?si=FAtDnPZbfyYJ-lc_&amp;list=PLoI6SfoHAoCex8jHpvmI-6w2vyv_Y-cUP"
              title="YouTube video player"
              frameborder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
              referrerpolicy="strict-origin-when-cross-origin"
              allowfullscreen>
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
