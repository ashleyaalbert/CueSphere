defmodule AppWeb.RulesLive do
  use AppWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <div class="flex flex-col items-center justify-center w-full h-full p-4">
      <h1 class="text-4xl font-bold mb-6 dark:text-white">
        {gettext("Official Rules of Billiards Games")}
      </h1>
      <p class="text-gray-700 mb-8 dark:text-white text-center max-w-3xl">
        {gettext(
          "Explore the official rules for the popular billiards games 8-Ball, 9-Ball, 10-Ball, and Straight Pool. These rules are based on standards by the World Pool-Billiard Association (WPA) and the Billiard Congress of America (BCA)."
        )}
      </p>

      <div class="space-y-10 bg-gray-50 p-6 rounded-lg shadow-md dark:bg-gray-700 dark:text-white w-full max-w-4xl">
        <%!-- General Rules --%>
        <div class="bg-white dark:bg-gray-800 p-6 rounded-lg shadow-md">
          <h2 class="text-3xl font-semibold mb-4">{gettext("General Rules")}</h2>
          <ul class="list-disc list-inside space-y-4 text-gray-800 dark:text-white">
            <li>
              <strong>{gettext("Player Responsibility: ")}</strong>
              {gettext(
                "Know all rules, schedules, and equipment use. The ultimate responsibility rests with the player."
              )}
            </li>
            <li>
              <strong>{gettext("Lagging: ")}</strong>
              {gettext(
                "Used to determine the first shooter. The referee will place a ball on each side of the table behind the head string and near the head string. The players will shoot at about the same time to make each ball contact the foot cushion with the goal of returning the ball closer to the head cushion than the opponent."
              )}
            </li>
            <li>
              <strong>{gettext("Equipment Use: ")}</strong>
              {gettext(
                "Only WPA-approved equipment may be used. Equipement that is considered normal includes a cue stick, which can be changed throughout the match, gloves, powder, chalk that is compatible with the cloth color, and up to two mechanical bridges"
              )}
            </li>
            <li>
              <strong>{gettext("Ball Spotting: ")}</strong>
              {gettext(
                "Balls are spotted (returned to play on the table) by placing them on the long string (long axis of the table) as close as possible to the foot spot and between the foot spot and the foot rail, without moving any interfering ball."
              )}
            </li>
            <li>
              <strong>{gettext("Cue Ball in Hand: ")}</strong>
              {gettext(
                "When the cue ball is in hand, the shooter may place the cue ball anywhere on the playing surface and may continue to move the cue ball until they execute a shot."
              )}
            </li>
            <li>
              <strong>{gettext("Call Shots: ")}</strong>
              {gettext(
                "In games in which the shooter is required to call shots, the intended ball and pocket must be indicated for each shot if they are not obvious. Details of the shot, such as cushions struck or other balls contacted or pocketed are irrelevant. Only one ball may be called on each shot."
              )}
            </li>
            <li>
              <strong>{gettext("Balls Settling: ")}</strong>
              {gettext(
                "A ball may settle slightly after it appears to have stopped, possibly due to slight imperfections in the ball or the table. Ball movement post-shot may be restored under certain conditions."
              )}
            </li>
            <li>
              <strong>{gettext("Outside Interference: ")}</strong>
              {gettext(
                "Referee restores position of the balls that were interfered with or calls stalemate if the balls cannot be restored to their original positions."
              )}
            </li>
            <li>
              <strong>{gettext("Concession: ")}</strong>
              {gettext(
                "A conceded game is a loss. For example, if a player unscrews their jointed playing cue stick while the opponent is at the table and during the opponent’s decisive rack of a match, it will be considered a concession of the match."
              )}
            </li>
            <li>
              <strong>{gettext("Stalemate: ")}</strong>
              {gettext(
                "If the referee observes that no progress is being made towards a conclusion, they will announce their decision, and each player will have three more turns at the table. Then, if the referee determines that there is still no progress, they will declare a stalemate. If both players agree, they may accept the stalemate without taking their three additional turns."
              )}"
            </li>
          </ul>
          <a
            href="https://wpapool.com/rules-of-play/"
            class="hover:underline mt-2 inline-block"
            target="_blank"
            rel="noopener noreferrer"
          >
            {gettext("View WPA's full rules")}
          </a>
        </div>

        <%!-- 8-Ball Rules --%>
        <div class="bg-white dark:bg-gray-800 p-6 rounded-lg shadow-md">
          <h2 class="text-3xl font-semibold mb-4">{gettext("8-Ball Rules")}</h2>
          <ul class="list-disc list-inside space-y-4 text-gray-800 dark:text-white">
            <li>
              <strong>{gettext("Objective: ")}</strong>
              {gettext(
                "Eight ball is played with fifteen numbered object balls and the cue ball. The shooter’s group of seven balls (one through seven or nine through fifteen) must all be off the table before they attempt to pocket the eight ball to win. Shots are called."
              )}
            </li>
            <li>
              <strong>{gettext("Lag: ")}</strong>
              {gettext(
                "The winnning player of the lag has the option to break or pass the break to the opponent."
              )}
            </li>
            <li>
              <strong>{gettext("Eight Ball Rack: ")}</strong>
              {gettext(
                "The fifteen object balls are racked as tightly as possible in a triangle, with the apex ball on the foot spot and the eight ball as the first ball that is directly below the apex ball. One from each group of seven will be on the two lower corners of the triangle. The other balls are placed in the triangle randomly."
              )}
            </li>
            <li>
              <strong>{gettext("Break: ")}</strong>
              {gettext(
                "The cue ball must be behind the head string. Four balls need to touch a rail (or rails) or a pocketed ball is required for the break to be valid."
              )}
            </li>
            <li>
              <strong>{gettext("Open Table: ")}</strong>
              {gettext(
                "The table is said to be “open” before groups are determined. Before each shot, the shooter must call their intended ball. If the shooter legally pockets their called ball, the corresponding group becomes theirs, and their opponent is assigned the other group. If they fail to legally pocket their called ball, the table remains open and play passes to the other player. When the table is “open”, any object ball may be struck first except the eight ball."
              )}
            </li>
            <li>
              <strong>{gettext("Continuous Play: ")}</strong>
              {gettext(
                "The shooter remains at the table until they fail to legally pocket a ball. If the shooter fails to legally pocket a ball, the opponent takes their turn at the table."
              )}
            </li>
            <li>
              <strong>{gettext("Call Shot: ")}</strong>{gettext(
                "Every shot (except the break) must be called, including \"safety\" shots."
              )}
            </li>
            <li>
              <strong>{gettext("Losing: ")}</strong>{gettext(
                "A shooter losses the game if the eight ball is pocketed while fouling, is pocketed before their group is cleared, is pocketed in an uncalled pocket, or is driven off of the table."
              )}
            </li>
          </ul>
        </div>

        <%!-- 9-Ball Rules --%>
        <div class="bg-white dark:bg-gray-800 p-6 rounded-lg shadow-md">
          <h2 class="text-3xl font-semibold mb-4">{gettext("9-Ball Rules")}</h2>
          <ul class="list-disc list-inside space-y-4 text-gray-800 dark:text-white">
            <li>
              <strong>{gettext("Objective: ")}</strong>
              {gettext(
                "Nine ball is played with nine object balls numbered one through nine and the cue ball. The balls are played in ascending numerical order. The player legally pocketing the nine ball wins the rack."
              )}
            </li>
            <li>
              <strong>{gettext("Lag: ")}</strong>
              {gettext(
                "The winnning player of the lag has the option to break or pass the break to the opponent."
              )}
            </li>
            <li>
              <strong>{gettext("Nine Ball Rack: ")}</strong>
              {gettext(
                "The object balls are racked as tightly as possible in a diamond shape, with the one ball at the apex of the diamond and on the foot spot and the nine ball in the middle of the diamond. The other balls will be placed in the diamond randomly."
              )}
            </li>
            <li>
              <strong>{gettext("Break: ")}</strong>
              {gettext(
                "The cue ball must be behind the head string. Four balls need to touch a rail (or rails) or a pocketed ball is required for the break to be valid."
              )}
            </li>
            <li>
              <strong>{gettext("Push Out: ")}</strong>
              {gettext(
                "After a legal break, the shooter may choose to play a \“push out\” as their shot. They must tell the refree so that the wrong ball first and no rail contact rules do not apply. The other player then decides who will shoot next by accepting or rejecting the \"push out\" shot."
              )}
            </li>
            <li>
              <strong>{gettext("Continuous Play: ")}</strong>
              {gettext(
                "The shooter remains at the table until they fail to legally pocket a ball. If the shooter fails to legally pocket a ball, the opponent takes their turn at the table. If they legally pocket the nine ball on any shot (except a push out), they win the rack"
              )}
            </li>
            <li>
              <strong>{gettext("Fouls: ")}</strong>
              {gettext(
                "Standard fouls of nine ball include cue ball scratch, wrong ball first, no rail after contact, no foot on floor, ball driven off the table, touched ball, double hit, push shot, balls still moving, bad cue ball placement, cue stick on the table, playing out of turn, slow play, and ball rack template foul."
              )}
            </li>
            <li>
              <strong>{gettext("Serious Foul: ")}</strong> {gettext(
                "3 fouls in one rack results in loss of rack."
              )}
            </li>
          </ul>
        </div>

        <%!-- 10-Ball Rules --%>
        <div class="bg-white dark:bg-gray-800 p-6 rounded-lg shadow-md">
          <h2 class="text-3xl font-semibold mb-4">{gettext("10-Ball Rules")}</h2>
          <ul class="list-disc list-inside space-y-4 text-gray-800 dark:text-white">
            <li>
              <strong>{gettext("Objective: ")}</strong>
              {gettext(
                "Ten ball is a call shot game played with ten object balls numbered one through ten and the cue ball. The balls are played in ascending numerical order and the lowest numbered ball must be contacted by the cue ball in order to establish a legal hit. If the ten ball is pocketed on a legal break shot, it will be re-spotted and the player continues with his inning. Only one ball may be called on each shot, except on the break shot where no ball may be called."
              )}
            </li>
            <li>
              <strong>{gettext("Lag: ")}</strong>
              {gettext(
                "The winnning player of the lag has the option to break or pass the break to the opponent. The standard format is to alternate the break."
              )}
            </li>
            <li>
              <strong>{gettext("Ten Ball Rack: ")}</strong>
              {gettext(
                "The object balls are racked as tightly as possible in a triangular shape, with the one ball at the apex of the triangle and on the foot spot and the ten ball in the middle of the triangle. The other balls will be placed in the triangle randomly."
              )}
            </li>
            <li>
              <strong>{gettext("Break: ")}</strong>
              {gettext(
                "The cue ball must be behind the head string. Four balls need to touch a rail (or rails) or a pocketed ball is required for the break to be valid."
              )}
            </li>
            <li>
              <strong>{gettext("Push Out: ")}</strong>
              {gettext(
                "After a legal break, the shooter may choose to play a \“push out\” as their shot. They must tell the refree so that the wrong ball first and no rail contact rules do not apply. The other player then decides who will shoot next by accepting or rejecting the \"push out\" shot. The ten ball pocketed during a \"push out\" is re-spotted, without penalty"
              )}
            </li>
            <li>
              <strong>{gettext("Call Shot: ")}</strong>
              {gettext("Every shot (except the break) must be called, including \"safety\" shots.")}
            </li>
            <li>
              <strong>{gettext("Safety: ")}</strong>
              {gettext(
                "The shooter, after the break at any time may call “safety” which permits them to make contact with the legal object ball without pocketing a ball and end their inning. However, if the shooter pockets the legal object ball the incoming player has the option to play the shot as left, or hand it back to their opponent."
              )}
            </li>
            <li>
              <strong>{gettext("Wrongfully Pocketed Balls: ")}</strong>
              {gettext(
                "If a player misses their intended ball and pocket, and either makes the nominated ball in the wrong pocket or pockets another ball, their inning has finished and the incoming player has the option to take the shot as is, or hand it back to their opponent."
              )}
            </li>
            <li>
              <strong>{gettext("Continuous Play: ")}</strong>
              {gettext(
                "If the shooter legally pockets a called/nominated ball on a shot, any additional balls pocketed remain pocketed, and they continue at the table for the next shot. If a player nominates and legally pockets the ten ball prior to the ten ball being the last remaining ball, the ten ball is re-spotted and the shooter continues, while pocketing the ten ball as a final ball at the table, they win the rack. If the shooter fails to pocket the called ball or fouls, play passes to the other player, and if no foul was committed, the incoming player must play the cue ball from the position left by the other player."
              )}
            </li>
            <li>
              <strong>{gettext("Fouls: ")}</strong>
              {gettext(
                "Standard fouls of ten ball include cue ball scratch, wrong ball first, no rail after contact, no foot on floor, ball driven off the table, touched ball, double hit, push shot, balls still moving, bad cue ball placement, cue stick on the table, playing out of turn, slow play, and ball rack template foul."
              )}
            </li>
            <li>
              <strong>{gettext("Serious Foul: ")}</strong> {gettext(
                "3 fouls in one rack results in loss of rack."
              )}
            </li>
          </ul>
        </div>

        <%!-- 14.1 Continuous / Straight Pool Rules --%>
        <div class="bg-white dark:bg-gray-800 p-6 rounded-lg shadow-md">
          <h2 class="text-3xl font-semibold mb-4">
            {gettext("Straight Pool Rules")}
          </h2>
          <ul class="list-disc list-inside space-y-4 text-gray-800 dark:text-white">
            <li>
              <strong>{gettext("Objective: ")}</strong>
              {gettext(
                "Straight pool, also known as 14.1 Continuous Pool, is played with fifteen numbered balls and the cue ball. Each ball pocketed on a legal called shot counts one point and the first player to reach the required score wins the match. Straight pool is continuous in that after fourteen balls are pocketed, they are re-racked and the shooter continues."
              )}
            </li>
            <li>
              <strong>{gettext("Lag: ")}</strong>
              {gettext(
                "The winnning player of the lag has the option to break or pass the break to the opponent."
              )}
            </li>
            <li>
              <strong>{gettext("Straight Pool Rack: ")}</strong>
              {gettext(
                "For an opening break shot, the fifteen balls are racked in a triangle with the apex ball on the foot spot. When the balls are re-racked, the apex ball is committed if only fourteen balls are being racked. The marked outline of the triangle will be used to determine whether an intended break ball is in the rack area. When ball rack template is used at 14.1 the outline of a triangle will still be drawn for the purpose of deciding whether a ball is in the rack area."
              )}
            </li>
            <li>
              <strong>{gettext("Opening Break: ")}</strong>
              {gettext("To break, the cue ball is in hand behind the head string and a called ball must be pocketed. If no called ball is pocketed, the cue ball and two object balls must each be driven to a rail after the cue ball contacts the rack or the shot is a breaking foul. This is penalized by subtracting two points from the breaker’s score. The non-breaking player may accept the balls in position or may require the breaker to play another opening break shot, until they satisfy the requirements for an opening break or the non-shooting player accepts the table in position.")}
            </li>
            <li>
              <strong>{gettext("Continuous Play: ")}</strong>
              {gettext(
                "The shooter remains at the table as long as he continues to legally pocket called balls or wins the game by scoring the required number of points. When fourteen balls from a rack have been legally pocketed, play is suspended until the balls are re-racked."
              )}
            </li>
            <li>
              <strong>{gettext("Call Shot: ")}</strong>{gettext(
                "Every shot must be called, including \"safety\" shots. Any object ball pocketed on the safety is spotted."
              )}
            </li>
            <li>
              <strong>{gettext("Spotting Balls: ")}</strong>{gettext(
                "All balls pocketed on fouls, or on safeties, or without a called ball having been pocketed, and all balls driven off the table are spotted. If the fifteenth ball of a rack needs to be spotted and the fourteen balls have not been touched, the fifteenth ball will spot on the apex spot and the referee may use the triangle to assure a tight rack."
              )}
            </li>
            <li>
              <strong>{gettext("Scoring: ")}</strong>{gettext(
                "The shooter scores one point for legally pocketing a called shot. Each additional ball pocketed on such a shot also counts one point. Fouls are penalized by subtracting points from the offending player’s score. Scores may be negative due to penalties from fouls."
              )}
            </li>
            <li>
              <strong>{gettext("Fouls: ")}</strong>
              {gettext(
                "Standard fouls of ten ball include cue ball scratch, no rail after contact, no foot on floor, ball driven off the table, touched ball, double hit, push shot, balls still moving, bad cue ball placement, bad play from behind head string, cue stick on the table, playing out of turn, slow play, and ball rack template foul."
              )}
            </li>
            <li>
              <strong>{gettext("Breaking Foul: ")}</strong> {gettext(
                "A breaking foul is penalized by the loss of two points, as well as a possible re-break. If both a standard foul and a breaking foul happen on one shot, it is considered a breaking foul. "
              )}
            </li>
            <li>
              <strong>{gettext("Serious Foul: ")}</strong> {gettext(
                "For the 3 Consecutive Fouls Rule, only standard fouls are counted, so a breaking foul does not count as one of the three fouls. A point is subtracted for the third foul as usual, and then the additional fifteen-point penalty is subtracted and the offending player’s consecutive foul count is reset to zero. All fifteen balls are re-racked and the offending player is required to shoot under the requirements of the opening break"
              )}
            </li>
          </ul>
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
