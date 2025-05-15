defmodule AppWeb.TutorialsLive do
  use AppWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <div class="flex flex-col items-center justify-center w-full h-full p-4">
    <h1 class="text-center text-4xl font-bold mb-6 text-gray-900 dark:text-white">{gettext("Tutorials")}</h1>
      <p class="text-lg text-gray-900 mb-8 dark:text-white text-center max-w-3xl">
        {gettext(
          "This page is intended for beginners to learn the basics of pool. If you are looking for more advanced content, check out the Drills page!"
        )}
      </p>
      <!-- First Video -->
      <div class="mt-4 space-y-10 bg-gray-100 p-6 rounded-lg shadow-md dark:bg-gray-700 dark:text-white">
        <div>
          <h2 class="text-2xl font-semibold mb-2 dark:text-white">
            {gettext("Learn to Play Pool in 3 Minutes")}
          </h2>
          <p class="text-gray-900 mb-4 dark:text-white">
            {gettext(
              "This pool lesson gives a quick introduction to all of the basics from fundamentals to aiming and cue ball control in just three minutes."
            )}
          </p>
          <div class="w-full max-w-4xl" style="position: relative; padding-bottom: 56.25%; height: 0;">
            <iframe
              width="100%"
              height="315"
              src="https://www.youtube.com/embed/DZEP-7mRVsA?si=lQuRfUrresDbraKX"
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
          <h2 class="text-2xl font-semibold mb-2 dark:text-white">
            {gettext("How to Aim in 1 Minute")}
          </h2>
          <p class="text-gray-900 mb-4 dark:text-white">
            {gettext("All the basics in 1 minute. How to line up your shot and aim properly.")}
          </p>
          <div class="w-full max-w-4xl" style="position: relative; padding-bottom: 56.25%; height: 0;">
            <iframe
              width="100%"
              height="315"
              src="https://www.youtube.com/embed/m9X-Ed3URRc?si=hfeuoyPNB32KRgFk"
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
          <h2 class="text-2xl font-semibold mb-2 dark:text-white">
            {gettext("Pool Basics for Beginners Playlist")}
          </h2>
          <p class="text-gray-900 mb-4 dark:text-white">
            {gettext(
              "This playlist contains 14 videos that cover the basics of pool, including grip, stance, stroke, and follow-through. It is perfect for beginners who want to learn the fundamentals of the game."
            )}
          </p>
          <div class="w-full max-w-4xl" style="position: relative; padding-bottom: 56.25%; height: 0;">
            <iframe
              width="100%"
              height="315"
              src="https://www.youtube.com/embed?listType=playlist&list=PLkequvHFHo7FSsW3RroQL822Uoj8hgt9C"
              title="Pool Tutorials Playlist"
              style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"
              frameborder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
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
