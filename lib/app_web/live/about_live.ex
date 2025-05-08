defmodule AppWeb.AboutLive do
  use AppWeb, :live_view
  import AppWeb.Components.UI.Carousel

  @impl true
  def render(assigns) do
    ~H"""
    <div class="max-w-5xl mx-auto p-6 space-y-12 text-gray-800">
      <section>
        <h1 class="text-4xl font-bold mb-4 text-center dark:text-white">
          {gettext("About This Project")}
        </h1>
      </section>

    <!-- Why -->
      <section class="bg-gray-50 p-6 rounded-lg shadow-md dark:bg-gray-700 dark:text-white">
        <h2 class="text-2xl font-semibold mb-4">{gettext("Why Did I Make a Website About Pool?")}</h2>

        <div class="space-y-6">
          <div>
            <h3 class="text-xl font-medium mb-2">{gettext("Always Around Pool")}</h3>
            <p>
              {gettext(
                "Growing up, my grandfather had a pool table in the entrance of his home. Both my grandfather and father have always played, and still do play, pool. I learned how to play pool from the both of them from a young age and spent lots of time on my grandfather's Brunswick table. I got my first pool cue around the age of 13 but never took it too seriously. Since I now have two Diamond pool tables in my new home, I became serious about pool again in May 2024. Currently, I play on a few teams and am getting actively trained and guided by some of the best players in the game to reach my full potential."
              )}
            </p>
          </div>

          <div>
            <h3 class="text-xl font-medium mb-2">{gettext("The One and Only")}</h3>
            <p>
              {gettext(
                "This website is a unique, one and only type of website. This personal project shares my love of pool while being a central information place for all things pool. You can find facts about pool, your Fargo Rate, all the items you possibly need to purchase, tutorials for beginners, drills for more advanced players, books to read, movies to watch, rules of the games, the different games out there, leagues to join, and tournaments to go to."
              )}
            </p>
          </div>
        </div>
      </section>

    <!-- Images -->
      <section class="bg-gray-50 p-6 rounded-lg shadow-md dark:bg-gray-700 dark:text-white">
        <div class="flex items-center justify-center gap-2 mb-4">
          <img src="/images/decorative-wave.png" alt={gettext("black decorative wave")} class="h-6 w-6 block dark:hidden" />
          <img src="/images/decorative-wave-white.png" alt={gettext("white decorative wave")} class="h-6 w-6 hidden dark:block" />
          <h2 class="text-2xl font-semibold mb-4 text-center dark:text-white">
            {gettext("Snapshots of My Journey")}
          </h2>
          <img src="/images/decorative-wave-2.png" alt={gettext("black decorative wave")}  class="h-6 w-6 block dark:hidden" />
          <img src="/images/decorative-wave-white-2.png" alt={gettext("white decorative wave")} class="h-6 w-6 hidden dark:block" />
        </div>
        <.carousel />
      </section>

    <!-- Stories -->
      <section class="bg-gray-50 p-6 rounded-lg shadow-md dark:bg-gray-700 dark:text-white">
        <h2 class="text-2xl font-semibold mb-4">{gettext("Personal Journey")}</h2>

        <div class="space-y-6">
          <div>
            <h3 class="text-xl font-medium mb-2">{gettext("Shamokin West End")}</h3>
            <p>
              {gettext(
                "The Shamokin West End is the first place I began seriously competing against other players. I began as a 21 year old, thus I was easily the youngest player in the bar, and also one of the only females. Each week I would put myself out there to compete against these men who were typically older and significantly better than me. Even though I have way more losses then wins, I learn a lot from each match and have grown tremendously from this opportunity."
              )}
            </p>
          </div>

          <div>
            <h3 class="text-xl font-medium mb-2">{gettext("Shamokin Moose Doubles")}</h3>
            <p>
              {gettext(
                "The Shamokin Moose is where I won my very first tournament (October 2024)! This was a partnered and single-elimination 8-ball doubles event. It was a benefit for a local player who had cancer. This was a great cause that we were happy to contribute to and give all the prize money back to as well."
              )}
            </p>
          </div>

          <div>
            <h3 class="text-xl font-medium mb-2">{gettext("Blue Mountain Billiards")}</h3>
            <p>
              {gettext(
                "Blue Mountain Billiards is a billiards hall that has at least 16 7' tables. My sister and I have attended multiple tournaments here. We have gained a lot of experiences and played women from all over. Nicole Nester, a female pro, is always here and has become one of our best friends and our biggest role model!"
              )}
            </p>
          </div>

          <div>
            <h3 class="text-xl font-medium mb-2">{gettext("Central PA Barbox")}</h3>
            <p>
              {gettext(
                "In November 2024, my whole family attended the Genetti Hotel in Williamsport, PA for the Central PA Barbox tournament. It was one of my first big tournaments, which I was super nervous for. I played in the women's 8-ball singles and the jack and jill 8-ball doubles with Derek Daya. I did not do great in either event due to my nerves, but I will be ready for this year."
              )}
            </p>
          </div>

          <div>
            <h3 class="text-xl font-medium mb-2">{gettext("Carisle Moose")}</h3>
            <p>
              {gettext(
                "I traveled to the Carisle Moose for a cancer benefit tournament. I competed in the women's 8-ball singles. I played very well against a high-ranked player, but lost my matches. It was a great experience and environment, but there was not enough tables for the players. I am happy I supported a good cause, but I am unsure if I will attend again. Side note, the drive home was horrible since it was during a blizzard and I slid a few times driving but arrived home safely eventually."
              )}
            </p>
          </div>

          <div>
            <h3 class="text-xl font-medium mb-2">{gettext("Shamokin Women's League")}</h3>
            <p>
              {gettext(
                "I had the privilege of joing the Saint Francis Home Association's women's 8-ball team. We competed every Thursday from October to April (with a few weeks off for holidays). I did contribute a positive amount of points to the team and we finished 19-1. We ended up as first in the league for the fourth year in a row. It was a successful first-year on the team to say the least."
              )}
            </p>
          </div>

          <div>
            <h3 class="text-xl font-medium mb-2">{gettext("Shamokin TAP League")}</h3>
            <p>
              {gettext(
                "I had the privilege of joining a TAP League team with my dad and his friends. We had the second highest amount of wins in the league and won the title holders tournament at the end of April. I did not do great on Saturday or the beginning of Sunday, but I did win my last match which put us into the championship match. My dad won the last match for us to win the championship, but it was a team effort throughout since we had to win 3/5 matches all day Sunday or else we would be eliminated. I got two T-Shirts for free as well as $300 since our team split $2.4k."
              )}
            </p>
          </div>

          <div>
            <h3 class="text-xl font-medium mb-2">{gettext("Joe and Derek")}</h3>
            <p>
              {gettext(
                "Although my father and grandfather have taught me a lot, I have to thank Joe Schmidt and Derek Daya for the training and advice they have been providing me. They both have been working with me for countless hours to improve my game. I am super grateful that they are willing to help me and share their knowledge. I have learned so much from them and I am excited to see how much more I can learn and improve in the future."
              )}
            </p>
          </div>
        </div>
      </section>
    </div>
    """
  end
end
