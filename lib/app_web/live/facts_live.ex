defmodule AppWeb.FactsLive do
  use AppWeb, :live_view
  import AppWeb.Components.UI.Timeline
  use Gettext, backend: AppWeb.Gettext

  @impl true
  def render(assigns) do
    ~H"""
    <div class="flex flex-col items-center justify-center w-full h-full p-4">
      <h1 class="text-4xl font-bold text-gray-900 dark:text-white">{gettext("Billiards Facts and History")}</h1>
      <p class="mt-4 text-lg text-gray-700 dark:text-gray-300">{gettext("A brief listing of facts and the history of billiards as it evolved over the centuries.")}</p>
      </div>
    <.timeline entries={[
      %{
        date: gettext("1400s"),
        title: gettext("Origins of Billiards"),
        description: gettext("Billiards evolves from a lawn game similar to croquet, likely in France or Northern Europe. Billiards is played on a wooden table with green cloth, to represent grass, with maces (wooden sticks) to shove balls. The word billiard comes from the French billart (stick) or bille (ball)."),
      },
      %{
        date: gettext("Early 1600s"),
        title: gettext("First Reference to Billiards"),
        description: gettext("Shakespeare references billiards in Antony and Cleopatra, showing its growing popularity.")
      },
      %{
        date: gettext("Late 1600s"),
        title: gettext("The Cue"),
        description: gettext("Cue sticks developed as a workaround for awkward mace positioning near rails. The term “cue” comes from the French word queue (tail). Only men were allowed to use cues initially—women had to use maces.")
      },
      %{
        date: gettext("1700s"),
        title: gettext("To America"),
        description: gettext("Billiards spreads through the American colonies; George Washington reportedly plays in 1748. English tables standardize the 2:1 length-to-width ratio. Rail banks evolve into playable surfaces, enabling bank shots. Public billiard tables become widespread in England and America.")
      },
      %{
        date: gettext("1770-1920"),
        title: gettext("Evolution"),
        description: gettext("English Billiards dominates in Britain; uses 3 balls, 6 pockets. One-Pocket origins described as early as 1775.")
      },
      %{
        date: gettext("1800s"),
        title: gettext("Industrial Revolution"),
        description: gettext("Billiards known as the \"Noble Game\", yet widely played across classes. The Industrial Revolution improves equipment, such as chalk used for friction, leather cue tips (1823), two-piece cues (1829), slate for tables (1835), and rubber cushions after Goodyear’s 1839 vulcanization discovery.")
      },
      %{
        date: gettext("1850"),
        title: gettext("Michael Phelan's Legacy"),
        description: gettext("Michael Phelan, \“Father of American Billiards,\” writes first U.S. rulebook. Pioneers standardized rules, diamonds for aiming, and weekly billiard columns. Wins a major stake match in 1859 and founds a major manufacturing company.")
      },
      %{
        date: gettext("1870s"),
        title: gettext("More Evolution"),
        description: gettext("American Four-Ball Billiards is popular in the U.S., later replaced by Straight Rail (carom-based) and Fifteen-Ball Pool, the predecessor to modern pool.")
      },
      %{
        date: gettext("1878"),
        title: gettext("First Championship"),
        description: gettext("First American Pool Championship held, using 61-point system (Fifteen-Ball Pool).")
      },
      %{
        date: gettext("1884"),
        title: gettext("Brunswick-Balke-Collender Company"),
        description: gettext("Formation of Brunswick-Balke-Collender Company, which dominates U.S. billiards industry.")
      },
      %{
        date: gettext("1888"),
        title: gettext("New Championship Game"),
        description: gettext("14.1 Continuous Pool replaces Fifteen-Ball Pool as the championship game.")
      },
      %{
        date: gettext("Early 1900s"),
        title: gettext("New Games"),
        description: gettext("Eight-Ball invented shortly after 1900. Straight Pool appears in 1910. Nine-Ball emerges around 1920.")
      },
      %{
        date: gettext("1906"),
        title: gettext("Hoppe"),
        description: gettext("Willie Hoppe, age 18, beats French champ in balkline, launching his long reign.")
      },
      %{
        date: gettext("1919-1941"),
        title: gettext("Greenleaf"),
        description: gettext("Ralph Greenleaf becomes U.S. pool hero, dominating for 20 years. Billiards and pool share public attention with stars like Hoppe and Greenleaf.")
      },
      %{
        date: gettext("1941-1950s"),
        title: gettext("Mosconi"),
        description: gettext("The Mosconi era begins; carom games decline as pool rises in popularity. Pool becomes a popular wartime pastime, but popularity fades after WWII. Post-war America sees a decline in poolroom culture as priorities shift.")
      }
    ]} />
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
