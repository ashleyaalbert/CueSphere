defmodule AppWeb.BooksLive do
  use AppWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <div class="mt-8 bg-white shadow-lg rounded-xl p-6 md:p-10 dark:bg-gray-800 dark:text-gray-200">
      <h2 class="text-2xl font-semibold text-center text-gray-700 dark:text-white">
        {gettext("Recommended Billiard Books")}
      </h2>
      <div class="mt-6 grid grid-cols-1 gap-6">
        <!-- Book 1 -->
        <div class="flex items-start space-x-4 bg-gray-200 p-4 rounded-lg dark:bg-gray-700">
          <img src={~p"/images/book1.jpg"} alt={gettext("Life Through Pool Book Cover")} class="w-24 h-32 object-cover rounded-md shadow" />
          <div>
            <h3 class="text-lg font-semibold text-blue-900 dark:text-white">{gettext("Life Through Pool")}</h3>
            <p class="text-sm text-gray-800 dark:text-gray-300 mb-2">
              {gettext("By Jospeh Schmidt — Life Through Pool by Joseph Schmidt uses the game of pool as a powerful metaphor for resilience, mindset, and personal growth. Once a promising pool prodigy, Schmidt's life changed drastically after suffering a severe brain injury from an assault. Initially feeling powerless, he later discovered the transformative power of language and mindset, learning that reframing his internal dialogue could help him regain his abilities and reshape his future.
              The book explores key themes such as self-control, patience, and discipline, showing how the principles of pool apply to life's challenges. Schmidt emphasizes that success is not just about skill but about the way we think, adapt, and overcome setbacks. Through personal experiences and practical insights, he encourages readers to embrace both victories and failures as opportunities for growth, making Life Through Pool both a guide to mastering the game and a deeper reflection on achieving success in life.")}
            </p>
            <a href="https://www.amazon.com/dp/B0F4KRZHVC?ref=cm_sw_r_ffobk_cp_ud_dp_TA38KNPSQQGXK3T05HOX&ref_=cm_sw_r_ffobk_cp_ud_dp_TA38KNPSQQGXK3T05HOX&social_share=cm_sw_r_ffobk_cp_ud_dp_TA38KNPSQQGXK3T05HOX&bestFormat=true&previewDoh=1" target="_blank"
              class="inline-block px-3 py-1 bg-blue-600 text-white text-sm rounded hover:bg-blue-700 transition">
              {gettext("Buy Now")}
            </a>
          </div>
        </div>

        <!-- Book 2 -->
        <div class="flex items-start space-x-4 bg-gray-200 p-4 rounded-lg dark:bg-gray-700">
          <img src={~p"/images/book2.jpg"} alt={gettext("The 99 Critical Shots in Pool: Everything You Need to Know to Learn and Master the Game Book Cover")} class="w-24 h-32 object-cover rounded-md shadow" />
          <div>
            <h3 class="text-lg font-semibold text-blue-900 dark:text-white">{gettext("The 99 Critical Shots in Pool: Everything You Need to Know to Learn and Master the Game")}</h3>
            <p class="text-sm text-gray-800 dark:text-gray-300 mb-2">
            {gettext("By Ray Martin - World Champion Pool Player Ray \"Cool Cat\" Martin shares his secrets for playing winner's pool in this classic book, which includes an introduction by the author. Written with co-author Rosser Reeves, The 99 Critical Shots in Pool remains one of the most authoritative guides to the game ever written. Over 200 illustrations show the proper form, technique, and approach to shots such as:")} </p>

            <ul class="list-disc list-inside text-sm text-gray-800 dark:text-gray-300 mb-2">
              <li>{gettext("The Center Ball Cheat-the-Pocket")}</li>
              <li>{gettext("The Hook Shot")}</li>
              <li>{gettext("The Seven Ball Stop Shot")}</li>
              <li>{gettext("The Jump Shot")}</li>
              <li>{gettext("The Frozen Kiss Shot")}</li>
              <li>{gettext("The Nudge Shot")}</li>
              <li>{gettext("The Side Pocket By-Pass Shot")}</li>
            </ul>

            <p class="text-sm text-gray-800 dark:text-gray-300 mb-2">
              {gettext("Ray Martin, a Billiards Congress of America Hall of Fame inductee, is one of only seven players in the twentieth century to win three or more world 14.1 titles. He co-wrote this book with Rosser Reeves in 1976.")}
            </p>
            <a href="https://www.amazon.com/99-Critical-Shots-Pool-Everything/dp/0812922417/ref=zg_bs_g_16536_d_sccl_1/131-5361470-6018031?psc=1" target="_blank"
              class="inline-block px-3 py-1 bg-blue-600 text-white text-sm rounded hover:bg-blue-700 transition">
              {gettext("Buy Now")}
            </a>
          </div>
        </div>

        <!-- Book 3 -->
        <div class="flex items-start space-x-4 bg-gray-200 p-4 rounded-lg dark:bg-gray-700">
          <img src={~p"/images/book3.jpg"} alt={gettext("Pool and Billiards For Dummies Book Cover")} class="w-24 h-32 object-cover rounded-md shadow" />
          <div>
            <h3 class="text-lg font-semibold text-blue-900 dark:text-white">{gettext("Pool and Billiards For Dummies")}</h3>
            <p class="text-sm text-gray-800 dark:text-gray-300 mb-2">
            {gettext("By Nicholas Leider - Practical, step-by-step tips for players of all levels
            From Snooker to Carom to good-old-fashioned 8- or 9-Ball, Pool & Billiards For Dummies reveals the tips, tricks, and rules of play, covering the variety of the ever-popular games that make up pool and billiards. This hands-on guide discusses everything from the rules and strategies of the games to how to set up a pool room to choosing the right equipment, and is accompanied by dozens of photos and line drawings.
            See how hard to hit the cue ball and where to hit it, the angle to hold the cue stick and how much chalk to use, how to use a bridge, and how to put spin on the ball
            Includes advanced pool techniques and trick shots for the seasoned pool sharp
            With Pool & Billiards For Dummies, even a novice can play like a champion!")}
            </p>
            <a href="https://www.amazon.com/Pool-Billiards-Dummies-Nicholas-Leider/dp/0470565535/ref=zg_bs_g_16536_d_sccl_3/131-5361470-6018031?psc=1" target="_blank"
              class="inline-block px-3 py-1 bg-blue-600 text-white text-sm rounded hover:bg-blue-700 transition">
              {gettext("Buy Now")}
            </a>
          </div>
        </div>

        <!-- Book 4 -->
        <div class="flex items-start space-x-4 bg-gray-200 p-4 rounded-lg dark:bg-gray-700">
          <img src={~p"/images/book4.jpg"} alt={gettext("A Mind for Pool: How To Master The Mental Game Book Cover")} class="w-24 h-32 object-cover rounded-md shadow" />
          <div>
            <h3 class="text-lg font-semibold text-blue-900 dark:text-white">{gettext("A Mind for Pool: How To Master The Mental Game")}</h3>
            <p class="text-sm text-gray-800 dark:text-gray-300 mb-2">
              {gettext("By Philip B Capelle — Pool is largely a mental game. So if you want to realise your full potential, you have got to eliminate the mental mistakes that are holding you back. A Mind for Pool will show you how to think pool like a champion. In the process you will learn how to: play under pressure; handle troublesome opponents; concentrate fully on every shot; overcome anger; adapt to the playing conditions; complete successfully in leagues, tournaments, and money games; evaluate and improve your game have much more fun; experience a quantum leap in your game.")}
            </p>
            <a href="https://www.amazon.com/Mind-Pool-Master-Mental-Game/dp/0964920417/ref=zg_bs_g_16536_d_sccl_11/131-5361470-6018031?psc=1" target="_blank"
              class="inline-block px-3 py-1 bg-blue-600 text-white text-sm rounded hover:bg-blue-700 transition">
              {gettext("Buy Now")}
            </a>
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
