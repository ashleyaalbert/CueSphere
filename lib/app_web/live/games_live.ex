defmodule AppWeb.GamesLive do
  use AppWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <div class="p-8">
      <h1 class="text-4xl font-bold mb-6 dark:text-white">{gettext("Billiards Games")}</h1>
      <p class="text-gray-700 mb-4 dark:text-white">
        {gettext(
          "This page is intended to showcase the various billiards games that exist, such as 8-Ball, 9-Ball, 10-Ball, and more. Each game has its own unique rules and strategies, making them all enjoyable in their own way. Included on this page is key details to each game as well as videos to show how the game is played. To learn about the rules of each game, visit the Rules page.")}
      </p>
      <div class="space-y-10">
        <%!-- 8-Ball --%>
        <div>
          <h2 class="text-4xl font-semibold mb-2 dark:text-white">{gettext("8-Ball")}</h2>
          <p class="text-gray-700 mb-4 dark:text-white">
            {gettext("8-ball is a cue sport played with 15 object balls and a cue ball. The objective is to pocket all of your designated balls (either stripes or solids) and then legally pocket the 8-ball to win.")}
          </p>
          <div class="w-full max-w-4xl" style="position: relative; padding-bottom: 56.25%; height: 0;">
            <iframe
              width="100%"
              height="315"
              src="https://www.youtube.com/embed/s1KwZG9Hcds?si=55VJ_XdndUPf-pyz"
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
        <%!-- 9-Ball --%>
        <div>
          <h2 class="text-4xl font-semibold mb-2 dark:text-white">{gettext("9-Ball")}</h2>
          <p class="text-gray-700 mb-4 dark:text-white">
            {gettext("9-ball is a cue sport played with nine object balls and a cue ball. The objective is to legally pocket the 9-ball after hitting the lowest-numbered ball on the table.")}
          </p>
          <div class="w-full max-w-4xl" style="position: relative; padding-bottom: 56.25%; height: 0;">
            <iframe
              width="100%"
              height="315"
              src="https://www.youtube.com/embed/FUJeG5BQoHA?si=tMQ_XOlCd4WDn3vh"
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
        <%!-- 10-Ball --%>
        <div>
          <h2 class="text-4xl font-semibold mb-2 dark:text-white">{gettext("10-Ball")}</h2>
          <p class="text-gray-700 mb-4 dark:text-white">
            {gettext("10-ball is a cue sport played with ten object balls and a cue ball. The objective is to legally pocket the 10-ball after hitting the lowest-numbered ball on the table.")}
          </p>
          <div class="w-full max-w-4xl" style="position: relative; padding-bottom: 56.25%; height: 0;">
            <iframe
              width="100%"
              height="315"
              src="https://www.youtube.com/embed/xO2TX6oKd2Q?si=50tmFW2HBqyfFv15"
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
        <%!-- Straight Pool --%>
        <div>
          <h2 class="text-4xl font-semibold mb-2 dark:text-white">{gettext("Straight Pool")}</h2>
          <p class="text-gray-700 mb-4 dark:text-white">
            {gettext("Straight pool, also known as 14.1 continuous, is a cue sport where players can score points by pocketing any ball on the table. The objective is to reach a predetermined number of points.")}
          </p>
          <div class="w-full max-w-4xl" style="position: relative; padding-bottom: 56.25%; height: 0;">
            <iframe
              width="100%"
              height="315"
              src="https://www.youtube.com/embed/fKc0mb97VD8?si=FYV6uJWzidmct2Oj"
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
        <%!-- One Pocket --%>
        <div>
          <h2 class="text-4xl font-semibold mb-2 dark:text-white">{gettext("One Pocket")}</h2>
          <p class="text-gray-700 mb-4 dark:text-white">
            {gettext("One pocket is a cue sport where players must pocket balls into one of their designated pockets. The objective is to score a predetermined number of points by pocketing balls into your pocket while preventing your opponent from doing the same")}
          </p>
          <div class="w-full max-w-4xl" style="position: relative; padding-bottom: 56.25%; height: 0;">
            <iframe
              width="100%"
              height="315"
              src="https://www.youtube.com/embed/S99VkMOa4ow?si=Nxx6pPveVG2BP3mQ"
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
        <%!-- Snooker --%>
        <div>
          <h2 class="text-4xl font-semibold mb-2 dark:text-white">{gettext("Snooker")}</h2>
          <p class="text-gray-700 mb-4 dark:text-white">
            {gettext("Snooker is a cue sport where the objective is to score points by potting balls in a specific order. Players must hit the cue ball to strike the object balls and score points by potting them into pockets.")}
          </p>
          <div class="w-full max-w-4xl" style="position: relative; padding-bottom: 56.25%; height: 0;">
            <iframe
              width="100%"
              height="315"
              src="https://www.youtube.com/embed/aeSDWuyeTSE?si=Q_aWA_ZW-Y9dSsF4"
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
