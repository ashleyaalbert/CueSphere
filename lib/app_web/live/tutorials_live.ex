defmodule AppWeb.TutorialsLive do
  use AppWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <div class="p-8">
      <h1 class="text-4xl font-bold mb-6 dark:text-white">Tutorials</h1>

      <div class="space-y-10">
        <div>
          <h2 class="text-2xl font-semibold mb-2 dark:text-white">Learn to Play Pool in 3 Minutes</h2>
          <p class="text-gray-700 mb-4 dark:text-white">
            This pool lesson gives a quick introduction to all of the basics from fundamentals to aiming and cue ball control in just three minutes.
          </p>
          <div class="w-full max-w-2xl">
            <iframe
              width="100%"
              height="315"
              src="https://www.youtube.com/embed/DZEP-7mRVsA?si=lQuRfUrresDbraKX"
              title="YouTube video player"
              frameborder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
              referrerpolicy="strict-origin-when-cross-origin"
              allowfullscreen>
            </iframe>
          </div>
        </div>

        <div>
          <h2 class="text-2xl font-semibold mb-2 dark:text-white">How to Aim in 1 Minute</h2>
          <p class="text-gray-700 mb-4 dark:text-white">
            All the basics in 1 minute. How to line up your shot and aim properly.
          </p>
          <div class="w-full max-w-2xl">
            <iframe
              width="100%"
              height="315"
              src="https://www.youtube.com/embed/m9X-Ed3URRc?si=hfeuoyPNB32KRgFk"
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
            Pool Basics for Beginners Playlist
          </h2>
          <p class="text-gray-700 mb-4 dark:text-white">
            This playlist contains 14 videos that cover the basics of pool, including grip, stance, stroke, and follow-through. It is perfect for beginners who want to learn the fundamentals of the game.
          </p>
          <div class="w-full max-w-4xl" style="position: relative; padding-bottom: 56.25%; height: 0;">
            <iframe
              src="https://www.youtube.com/embed?listType=playlist&list=PLkequvHFHo7FSsW3RroQL822Uoj8hgt9C"
              title="Pool Tutorials Playlist"
              style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"
              frameborder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
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
