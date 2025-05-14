defmodule AppWeb.PurchaseLive do
  use AppWeb, :live_view
  alias YamlElixir
  import AppWeb.Components.UI.Accordion
  use Gettext, backend: AppWeb.Gettext

  @impl true
  def render(assigns) do
    ~H"""
    <div class="container mx-auto px-4">
      <div class="flex flex-col items-center justify-center w-full h-full p-4">
        <h1 class="text-4xl font-bold text-center mb-6">{gettext("Purchase Billiards Equipment")}</h1>
        <p class="mt-4 text-lg text-gray-700 dark:text-gray-300">
          {gettext(
            "A chart of billiards sales and a listing of links for billiards items to be purchased."
          )}
        </p>
      </div>

    <!-- Chart Section -->
      <div class="bg-white dark:bg-gray-700 dark:text-white shadow-lg rounded-lg p-6 mb-6">
        <p class="text-lg text-gray-700 dark:text-white mb-4">
          {gettext(
            "This chart demonstrates the increase in sales of billiards equipment in recent years. It highlights the growing demand for high-quality equipment and the rising popularity of billiards as a sport. Below the chart, you'll find more information about billiards equipment, along with links to purchase these items."
          )}
        </p>
        <canvas
          id="billiards-sales"
          phx-hook="Chart"
          width="400"
          height="200"
          data-config={
            Jason.encode!(%{
              type: "bar",
              data: @chart_data,
              options: %{
                responsive: true,
                plugins: %{
                  legend: %{display: true},
                  title: %{
                    display: true,
                    text: gettext("Billiards Equipment Sales in the U.S. by Year in Millions")
                  }
                },
                scales: %{
                  y: %{
                    beginAtZero: true,
                    title: %{display: true, text: gettext("Sales (in Millions USD)")}
                  },
                  x: %{
                    title: %{display: true, text: gettext("Years")}
                  }
                }
              }
            })
          }
        >
        </canvas>
      </div>

      <div class="accordion">
        <.accordion
          id="purchase"
          multiple={true}
          sections={[
            %{
              title: gettext("Billiard Balls"),
              content:
                gettext(
                  "<p class='mb-2 text-gray-900 dark:text-gray-100'> Billiard Balls, also known as object balls, are used in games of pool, such as 8-ball, 9-ball, Snooker, etc..</p>
                <ul class='list-disc list-inside'>
               <li><a href=\"https://www.brunswickbilliards.com/products/centennial-premium-individual-pocket-balls\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Centennial® Premium Individual Pocket Balls</a></li>
               <li><a href=\"https://www.billiards.com/collections/aramith/products/aramith-super-pro-set\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Aramith Super Pro Set</a></li>
               <li><a href=\"https://www.deltabilliards.com/cyclop-tv-edition-zeus-billiard-ball-set-040-101/\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Cyclop TV Edition ZEUS Billiard Ball Set - 040-101</a></li>
               <li><a href=\"https://www.billiards.com/products/aramith-snooker-ball-set-2-18th-inch?variant=43822634959077&country=US&currency=USD&utm_medium=product_sync&utm_source=google&utm_content=sag_organic&utm_campaign=sag_organic&dg=b&utm_source=google&utm_medium=cpc&utm_term=&utm_campaign=1147327343&gad_source=1&gad_campaignid=1147327343&gbraid=0AAAAAD9jFlAJ0XIPFPdN607PqglBT7xej&gclid=CjwKCAjwuIbBBhBvEiwAsNypvelfVVejpaLAfRN68Xz7F93NWlzAZ0B1iBA_X-8PpMBXYALwlA2CMhoC9agQAvD_BwE\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Aramith Snooker Ball Set 2 1/8th Inch</a></li>
              </ul>"
                )
            },
            %{
              title: gettext("Bridge"),
              content:
                gettext(
                  "<p class='mb-2 text-gray-900 dark:text-gray-100'>A bridge is a device used to support the cue stick when the cue ball is out of comfortable reach.</p>  <ul class='list-disc list-inside'>
               <li><a href=\"https://seyberts.com/collections/bridges/products/telescoping-pocket-bridge-stick-color-options-available?variant=41789055762630\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Telescoping Pocket Bridge Stick</a></li>
               <li><a href=\"https://www.pooldawg.com/moosehead-billiards-bridge-head-black?gad_source=1&gad_campaignid=22296243070&gbraid=0AAAAAD_OY0-kc8uNPI_0HlcKK_JhKIAWD&gclid=CjwKCAjwuIbBBhBvEiwAsNypvVpSCvxfWB5XaOW1wCSZvCyYQ6XV2hr2OCa-Hx6gjS5lAxMpa0qzxxoCqIcQAvD_BwE\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Moosehead Billiards Bridge Head</a></li>
                <li><a href=\"https://www.amazon.com/Accuplay-Billiards-Piece-Bridge-Regular/dp/B0DHT8YY7R/ref=asc_df_B0DHT8YY7R?mcid=0ec8b010e7473ac69eb37fa190f71f48&hvocijid=12584880496154204185-B0DHT8YY7R-&hvexpln=73&tag=hyprod-20&linkCode=df0&hvadid=721245378154&hvpos=&hvnetw=g&hvrand=12584880496154204185&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9190944&hvtargid=pla-2281435180258&th=1&psc=1\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Accuplay Billiards 57\" 2 Piece Maple Pool Bridge Stick</a></li>
                 <li><a href=\"https://www.pooldawg.com/cue-buddy-bridge?srsltid=AfmBOopomh1KmmaAUZhj5A9Gk4JoyliSChRdiiEeGdQc78FOqrKyHSVWYeg&gQT=1\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Cue Buddy Adaptive Bridge</a></li>
              </ul>"
                )
            },
            %{
              title: gettext("Case"),
              content:
                gettext(
                  "<p class='mb-2 text-gray-900 dark:text-gray-100'>A cue case is used to protect and transport cue sticks. They come in various styles including soft, hard, and box cases.</p>
                  <ul class='list-disc list-inside'>
               <li><a href=\"https://fcibilliards.com/instroke-vinyl-cowboy-black-pool-cue-case-3x5/\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Instroke 3x5 Vinyl Cowboy Black Pool Cue Case</a></li>
               <li><a href=\"https://www.omegabilliards.com/3x5-Acme-Piggyback-Case-red-p/3952.htm\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">4x6 Acme Piggyback Case Bk</a></li>
               <li><a href=\"https://www.predatorcues.com/usa/predator-urbain-blue-hard-pool-cue-case-2-butts-x-4-shafts.html\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Predator Urbain Blue Hard Pool Cue Case</a></li>
               <li><a href=\"https://www.amazon.com/PEKREWS-Pool-Cue-Case-2x2/dp/B0D2W2D81X/ref=sr_1_3_sspa?crid=24LLIRNFF77E9&dib=eyJ2IjoiMSJ9.GE6Zc1dmUBNAjLC4qml8zxUzs6fhFYcqvUHftOKqwkOPmu91JXzF0VNuJeOy5AinStu5OO73SoP2SBKYAaZYcn2OY6FjhrEa0UdrfYgDZCDuZb3VbKTE1K6QbgJy5EuAuiBbwEajmc3060PQtb2MLcXc8f8q3v4pjUIhwNHzOx1HjDFV5JZVRZL_stkiCUBCp4Zl9jQgGWUNR3mjCbas7TBTvuQAurmzWvPhLqphwhhLC_d9fwYo5GS1jKvocDIiCs03XmjdXnC3qTpKPDJjULSri2n0-Adx-Hkg7ram1Ew._kIjH4sxxJw8hCMWUvefC_WIRQvw3VReAZr4NpZo6jA&dib_tag=se&keywords=pool%2Bcase&qid=1747114713&sprefix=pool%2Bcase%2Caps%2C79&sr=8-3-spons&sp_csd=d2lkZ2V0TmFtZT1zcF9hdGY&th=1\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Pekrews Pool Cue Case</a></li>
              </ul>"
                )
            },
            %{
              title: gettext("Chalk"),
              content:
                gettext(
                  "<p class='mb-2 text-gray-900 dark:text-gray-100'>Chalk is applied to the cue tip to increase friction between the tip and the cue ball, reducing miscues.</p>
                  <ul class='list-disc list-inside'>
               <li><a href=\"https://www.amazon.com/TAOM-Billiard-Chalk-Handmade-Finland/dp/B07PWVBRTF?th=1\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">TAOM Pyro Chalk</a></li>
               <li><a href=\"https://www.pooldawg.com/master-chalk-box-of-12-cubes?gad_source=1&gad_campaignid=22296243070&gbraid=0AAAAAD_OY0-kc8uNPI_0HlcKK_JhKIAWD&gclid=CjwKCAjwuIbBBhBvEiwAsNypvUK--jFMVSW-zbNyz6vdeo0c5CCLvza8vTI-m-WyeuGjZt_nl_7wyhoC47MQAvD_BwE\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Master Chalk (Box of 12 Cubes)</a></li>
               <li><a href=\"https://www.predatorcues.com/usa/predator-1080-performance-billiard-chalk-5-pc-tube.html\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Predator 1080 Performance Billiard Chalk - 5 pc Tube</a></li>
               <li><a href=\"https://www.pooldawg.com/kamui-chalk-98-1-cube?gad_source=1&gad_campaignid=22307326487&gbraid=0AAAAAD_OY0-A_gbivD_hL75WEz1RkD0mi&gclid=CjwKCAjwuIbBBhBvEiwAsNypvRC1zeIBCFp4Ds3ImpEmt9Rq3FHdfR283E6CFG-GGrqWHTwPaGnxvRoCPbwQAvD_BwE\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Kamui Chalk .98</a></li>
              </ul>"
                )
            },
            %{
              title: gettext("Cleaner"),
              content:
                gettext(
                  "<p class='mb-2 text-gray-900 dark:text-gray-100'>Table and ball cleaners help maintain the condition of billiard equipment, ensuring smooth and consistent play.</p>
                  <ul class='list-disc list-inside'>
               <li><a href=\"https://www.pooldawg.com/pool-table-accessories/pool-and-billiard-balls/billiards-and-pool-ball-cleaning-tools/ballstar-pool-and-billiards-ball-cleaner\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">BallStar Pool Ball Cleaner</a></li>
               <li><a href=\"https://www.pooldawg.com/pool-table-accessories/pool-and-billiard-balls/billiards-and-pool-ball-cleaning-tools/aramith-billiard-ball-cleaning-solution\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Aramith Billiard Ball Cleaning Solution</a></li>
               <li><a href=\"https://quick-clean.com/quick-clean-single-can.html\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Quick-Clean (Single Can)</a></li>
               <li><a href=\"https://seyberts.com/collections/ball-cleaners/products/tiger-crystal-ball-cleaner-polisher?variant=41733360779462\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Tiger Crystal Ball Cleaner & Polisher</a></li>
              </ul>"
                )
            },
            %{
              title: gettext("Cue Ball"),
              content:
                gettext(
                  "<p class='mb-2 text-gray-900 dark:text-gray-100'>The cue ball is the white ball struck with the cue stick. It is used to hit the object balls during gameplay.</p>
                  <ul class='list-disc list-inside'>
               <li><a href=\"https://www.billiards.com/collections/cue-balls-8-balls/products/aramith-tournament-magnetic-cue-ball?_pos=1&_fid=f00dae785&_ss=c\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Aramith Tournament Magnetic Cue Ball</a></li>
               <li><a href=\"https://billiardsuperstore.com/aramith-tournament-black-dot-cue-ball/\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Aramith Tournament Black Dot Cue Ball</a></li>
               <li><a href=\"https://www.pooldawg.com/aramith-pro-cup-6-red-dot-tv-measles-cue-ball?gad_source=1&gad_campaignid=22307326487&gbraid=0AAAAAD_OY0-A_gbivD_hL75WEz1RkD0mi&gclid=CjwKCAjwuIbBBhBvEiwAsNypvZ3jPygkVAzc6osCqaAyFYlDgw42ltpK10AoLvAeVK8Kj4wtGuq2yhoCDOYQAvD_BwE\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Aramith Pro Cup 6 Red Dot TV 'Measles' Cue Ball</a></li>
               <li><a href=\"https://seyberts.com/products/aramith-red-circle-cue-ball?variant=41732478173382\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Aramith Red Circle Cue Ball</a></li>
              </ul>"
                )
            },
            %{
              title: gettext("Cue Holder"),
              content:
                gettext(
                  "<p class='mb-2 text-gray-900 dark:text-gray-100'>A cue holder is an accessory that can be set onto tables or other flat surfaces to safely secure your sticks vertically and ensure they do not fall.</p>
                  <ul class='list-disc list-inside'>
               <li><a href=\"https://www.billiards.com/collections/cue-holders/products/q-claw-cue-holder?variant=43811580805349\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Q-Claw Cue Holder</a></li>
               <li><a href=\https://www.predatorcues.com/usa/predator-folding-cue-holder-with-case.html?utm_source=shopping&utm_medium=cpc&utm_campaign=16740474638&utm_content=&gad_source=1&gad_campaignid=16740474638&gbraid=0AAAAAC9s9aIEEKqu1rKs_6ybNHGmwPacN&gclid=CjwKCAjwuIbBBhBvEiwAsNypvTsomzbt18E8DWGUzkt1VOerStLvGD71o_bLRsr9dk_Gm71CeiPlCxoCNNgQAvD_BwE\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Predator Folding Pool Cue Holder with Case</a></li>
               <li><a href=\"https://seyberts.com/products/extreme-3-pool-cue-holder?variant=41791570182342\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Extreme 3 Pool Cue Holder</a></li>
               <li><a href=\"https://www.amazon.com/Naissgo-Rest-Stick-Holder-Holes/dp/B08QV66YNF/ref=sr_1_5?dib=eyJ2IjoiMSJ9.8i3rQHNQ4S81bl5Kjz_mMj82C0MTCX2Ylx7UqyI0zSttUUvPsvsobGmJP0MItYx_4E9RIwjj8ivW7CMq0s30Sr_qpZxYYJ92tcguKtoe7L7UrDV2h2uW_3wZPh_kDJy-ukYbI5TuCwwum0HtndUJXwf7X__aZ8RMbqgnCXALk__Q9mJfKwFN8COwRsxseoAPWWuB4yGlivn28VWCuyVvLQTyQyr_bm7cv_rJVvvFkKqgWvG8AgJuyUfrfTdVTApnC9imntmSja7UHWdOIdHqHNimkZQMSs1Jm3S8jC3QqY4.7QSYoaZTHIuMFkBLISn8Ikk1lNEI6ibFEwMqj4kwL1w&dib_tag=se&keywords=cue%2Bholder&qid=1747115668&sr=8-5&th=1\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Naissgo Cue Stick Holder</a></li>
              </ul>"
                )
            },
            %{
              title: gettext("Cue Stick"),
              content:
                gettext(
                  "<p class='mb-2 text-gray-900 dark:text-gray-100'>A cue stick is the main tool used in billiards to strike the cue ball. Cues come in different weights, lengths, and materials.</p>
                  <ul class='list-disc list-inside'>
               <li><a href=\"https://www.meuccicues.com/products/97-10-meucci-cue\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">97-10 Meucci Cue</a></li>
               <li><a href=\"https://www.mcdermottcue.com/gs06.php\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">gs06</a></li>
               <li><a href=\"https://www.vikingcue.com/viking-ovation-ov0300/\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Viking Ovation OV0300</a></li>
               <li><a href=\"https://www.predatorcues.com/usa/predator-4-point-sneaky-pete-black-blue-points-no-wrap-pool-cue.html\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Predator 4 Point Sneaky Pete Black / Blue Points No Wrap Pool Cue</a></li>
               <li><a href=\"https://pechauer.com/product/al2/\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Pechauer AL2</a></li>
               <li><a href=\"https://www.pooldawg.com/brand/action/pool-cues/action-bw01-pool-cue\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Action BW01 Pool Cue</a></li>
               <li><a href=\"https://schoncues.com/product/stl-03/\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Schön STL 03</a></li>
               <li><a href=\"https://jacobycustomcues.com/JacobyCMS/jacoby-blackout-cues/65-96-blackout-black-jump-break.html#/23-sport_grip-no_wrap\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">BlaCkOut Black Jump/Break</a></li>
               <li><a href=\"https://www.omegabilliards.com/OMEGA-JUMP-5-p/1993.htm\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">OMEGA JUMP 5</a></li>
               <li><a href=\"https://www.predatorcues.com/usa/predator-bk-rush-break-cue-no-wrap.html\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Predator Black BK Rush® Break Cue - No Wrap</a></li>
              </ul>"
                )
            },
            %{
              title: gettext("Extension"),
              content:
                gettext(
                  "<p class='mb-2 text-gray-900 dark:text-gray-100'>Extensions can be attached to a cue stick to increase its length for hard-to-reach shots.</p>
                  <ul class='list-disc list-inside'>
               <li><a href=\"https://www.pooldawg.com/telescopic-cue-extender?gad_source=1&gad_campaignid=22296243070&gbraid=0AAAAAD_OY0-kc8uNPI_0HlcKK_JhKIAWD&gclid=CjwKCAjwuIbBBhBvEiwAsNypvd4sSdR9QS9FLcm9j4X1hS58MutO6acnuHlCIbqIlHKXf8QACyYT0hoCO3cQAvD_BwE\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Telescopic Cue Extender</a></li>
               <li><a href=\"https://www.predatorcues.com/usa/predator-qr-2-pool-cue-extension.html?utm_source=shopping&utm_medium=cpc&utm_campaign=16740474638&utm_content=&gad_source=1&gad_campaignid=16740474638&gbraid=0AAAAAC9s9aIEEKqu1rKs_6ybNHGmwPacN&gclid=CjwKCAjwuIbBBhBvEiwAsNypvQig1_CXqdW9MyvQwE-rsYqqC26qYcMmpJ8O96e9WW0FG2-cgFp6GhoCyXEQAvD_BwE\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Predator 8\" QR2 Cue Extension with Bumper</a></li>
               <li><a href=\"https://www.pooldawg.com/x10r-slip-on-extension?gad_source=1&gad_campaignid=22296243070&gbraid=0AAAAAD_OY0-kc8uNPI_0HlcKK_JhKIAWD&gclid=CjwKCAjwuIbBBhBvEiwAsNypvQTU_su8x3c7H5fVdWjxyMLTvraQBd3LghO0nHF4lauYnK9WPuzu9xoCLeMQAvD_BwE\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">X10R Slip-On 12\" Pool Cue Extension</a></li>
               <li><a href=\"https://www.pooldawg.com/pool-cue-accessories/x5-extfx5b-extension\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">X5 Black Pool Cue Extension</a></li>
              </ul>"
                )
            },
            %{
              title: gettext("Glove"),
              content:
                gettext(
                  "<p class='mb-2 text-gray-900 dark:text-gray-100'>Billiard gloves help reduce friction between the cue and the player’s bridge hand, promoting smoother strokes.</p>
                  <ul class='list-disc list-inside'>
               <li><a href=\"https://www.predatorcues.com/usa/predator-second-skin-black-gold-billiard-glove-30-anniversary-edition-left.html\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Predator Second Skin Black & Gold Billiard Glove 30th Anniversary - Left Hand</a></li>
               <li><a href=\"https://www.predatorcues.com/usa/predator-second-skin-black-gold-billiard-glove-30-anniversary-edition-right.html\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Predator Second Skin Black & Gold Billiard Glove 30th Anniversary - Right Hand</a></li>
               <li><a href=\"https://www.cuetec.com/products/axis-high-performance-billiard-gloves/axis-glove-noir/\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Cuetec Axis Glove Noir</a></li>
               <li><a href=\"https://www.amazon.com/Molinari-Billiard-Pool-Cue-Glove/dp/B0CXS9WTHV\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Molinari Billiard Pool Cue Glove - for Left Hand</a></li>
                <li><a href=\"https://www.amazon.com/Molinari-Billiard-Pool-Cue-Glove/dp/B0CXZKL71F/ref=sr_1_4?crid=1506K0YLCJVO4&dib=eyJ2IjoiMSJ9.k80MFGazpbij29gXUg7RqVM-BAcA75singOcXvLM4VY1mgtF3WcFzoDcuHFpRN6NjogjkbEVFX1MCwJj9toEBnOM-36LoTtW7-VLq_9uFekCoNkapoHoYEj1JQ5mqZB621uEr_PWns9P_IOqe7vqSWuGMJMmYTUx-q4aBUIVK3nSvMRcrh1EotbrQi-EaJsAoP0ymt7DonN7A6m3ft-SxsZ7Eqvr_ltvjTKl-TED5QyizNTgMpUA0MAlqKTPtbPIGcR9wDCCGoNOS7UUfL8YgsyEH8aKXo9bDx13P6Ms02o.bPdR6FqUsXIYDZzAF4Ca2MLGzedEYKd0MJUkitPo458&dib_tag=se&keywords=Molinari%2BBilliard%2BPool%2BCue%2BGlove%2B-%2Bfor%2BRight%2BHand&qid=1747117265&s=sporting-goods&sprefix=molinari%2Bbilliard%2Bpool%2Bcue%2Bglove%2B-%2Bfor%2Bright%2Bhand%2Csporting%2C51&sr=1-4&th=1\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Molinari Billiard Pool Cue Glove - for Right Hand</a></li>
              </ul>"
                )
            },
            %{
              title: gettext("Light"),
              content:
                gettext(
                  "<p class='mb-2 text-gray-900 dark:text-gray-100'>Proper lighting is essential for accurate aiming and overall visibility. Billiard lights are usually installed directly above the table.</p>
                  <ul class='list-disc list-inside'>
               <li><a href=\"https://weststatebilliards.com/product/diamond-light-7-foot/\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Diamond Littman Tournament Light</a></li>
               <li><a href=\"https://seyberts.com/collections/pool-table-lights/products/predator-7-foot-arena-light-predlight7ft4seg?variant=44211555008710\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Predator 7 Foot Arena Light</a></li>
               <li><a href=\"https://seyberts.com/products/predator-arena-7-light-4-segments?variant=43001230688454\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Predator 9 Foot Arena Light</a></li>
               <li><a href=\"https://seyberts.com/collections/pool-table-lights/products/t60-triple-1x8-led-light-9-foot-tables?variant=42790421364934\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Triple 60 Aluminum LED Billiard Light</a></li>
              </ul>"
                )
            },
            %{
              title: gettext("Powder"),
              content:
                gettext(
                  "<p class='mb-2 text-gray-900 dark:text-gray-100'>A rack is a frame used to arrange the balls in their starting positions for games like 8-ball, 9-ball, and straight pool.</p>
                  <ul class='list-disc list-inside'>
               <li><a href=\"https://www.amazon.com/Johnsons-Baby-Naturally-Cornstarch-Hypoallergenic/dp/B005IHT880/ref=zg_bs_g_322266011_d_sccl_1/131-5361470-6018031?th=1\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Johnson's Baby Naturally Derived Cornstarch Baby Powder</a></li>
               <li><a href=\"https://www.amazon.com/Silver-Cup-Billiard-Pool-Chalk/dp/B000OECJGK/ref=sr_1_5?dib=eyJ2IjoiMSJ9.Dl-EX_ctu756_qYy1jl70WEKxa4_v3l5IokkrayaZ16yHEfoq4AEJElxPH-xMGx8Z0dYWcogtdc_VseHOabKIPxwzR_aPVWRJNpKI5Uc3Fka5Bit3zAnpOlR2aVBAWeaRLL85kAOQkupfkcFemzOhQaH8IVelMBCkmbhJqthaV1HNT9HO__p49QmCTrIN3-lDHpWF2STa_2_lqTSxgFO6MjBeWfcGWDgPWHYSfmmID1dqY9aP2nsnTxgE05owvbN1q64VDWStzm4r9mCrThle3RIrYqGSfOCgqu_aOCmHgs.TEmrX_O32gnNV17nfGbEY8bDgM0T4aafYdkkuGk9bcw&dib_tag=se&keywords=cone+chalk&qid=1747117752&sr=8-5\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Silver Cup Billiard/Pool Cone Chalk</a></li>
               <li><a href=\"https://www.amazon.com/Master-Tweeten-Velvet-Glide-Billiard/dp/B007GC3GB0/ref=sr_1_9?dib=eyJ2IjoiMSJ9.Dl-EX_ctu756_qYy1jl70WEKxa4_v3l5IokkrayaZ16yHEfoq4AEJElxPH-xMGx8Z0dYWcogtdc_VseHOabKIPxwzR_aPVWRJNpKI5Uc3Fka5Bit3zAnpOlR2aVBAWeaRLL85kAOQkupfkcFemzOhQaH8IVelMBCkmbhJqthaV1HNT9HO__p49QmCTrIN3-lDHpWF2STa_2_lqTSxgFO6MjBeWfcGWDgPWHYSfmmID1dqY9aP2nsnTxgE05owvbN1q64VDWStzm4r9mCrThle3RIrYqGSfOCgqu_aOCmHgs.TEmrX_O32gnNV17nfGbEY8bDgM0T4aafYdkkuGk9bcw&dib_tag=se&keywords=cone+chalk&qid=1747117752&sr=8-9\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Master Velvet Glide Cone Talc</a></li>
               <li><a href=\"https://www.amazon.com/Silver-Cup-Billiard-Premium-Powder/dp/B07WYJQMSM/ref=sr_1_15?dib=eyJ2IjoiMSJ9.Dl-EX_ctu756_qYy1jl70WEKxa4_v3l5IokkrayaZ16yHEfoq4AEJElxPH-xMGx8Z0dYWcogtdc_VseHOabKIPxwzR_aPVWRJNpKI5Uc3Fka5Bit3zAnpOlR2aVBAWeaRLL85kAOQkupfkcFemzOhQaH8IVelMBCkmbhJqthaV1HNT9HO__p49QmCTrIN3-lDHpWF2STa_2_lqTSxgFO6MjBeWfcGWDgPWHYSfmmID1dqY9aP2nsnTxgE05owvbN1q64VDWStzm4r9mCrThle3RIrYqGSfOCgqu_aOCmHgs.TEmrX_O32gnNV17nfGbEY8bDgM0T4aafYdkkuGk9bcw&dib_tag=se&keywords=cone+chalk&qid=1747117752&sr=8-15\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Silver Cup Billiard/Pool Premium Powder Hand Chalk</a></li>
              </ul>"
                )
            },
            %{
              title: gettext("Rack"),
              content:
                gettext(
                  "<p class='mb-2 text-gray-900 dark:text-gray-100'>Bridge powder reduces friction on a player’s bridge hand, making cue strokes smoother, especially in humid conditions.</p>
                  <ul class='list-disc list-inside'>
               <li><a href=\"https://shop.diamondbilliards.com/products/diamond-8-ball-rack\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Diamond Wood 8-Ball Rack</a></li>
               <li><a href=\"https://shop.diamondbilliards.com/collections/all-products/products/diamond-cr-1-commercial-polycarbonate-8-ball-rack\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Diamond CR-1 Commercial Polycarbonate 8-Ball Rack</a></li>
               <li><a href=\"https://www.billiards.com/collections/racks-and-triangles/products/spencer-marston-8-ball-plastic-rack\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Spencer Marston 8 Ball Plastic Rack</a></li>
               <li><a href=\"https://www.billiards.com/collections/racks-and-triangles/products/billiardscom-magic-rack-combo-set\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Magic Rack Combo Set</a></li>
               <li><a href=\"https://www.amazon.com/TIHOOD-Billiards-Triangle-Accessories-Snooker/dp/B07PSPFVP1/ref=sr_1_23?c=ts&dib=eyJ2IjoiMSJ9.HyLd9o1EhG2LQrK1cjfMfMEc8gxqAlBtFlD2mvdztdg7b8ZMJ9q5E2C5DXYPOxrNkhX0uFMC6EEhxc1d1UX0YsNICohc3WWbYtgoCzwKiNPF5tkzB-xppHpg9R1W6_SiEc7C3mYtdVMyrUGOHgMKzMEZ-Q1F4Hj2A6lrbNhJhe9a1snKjkSsjEPbjLAwbynNqmydrx--kwUVOm9ogbbFpp4zVMnwNpxRxhERMedZsYsMjEgi8Iv6XLUoHqNrXy8BKOKFXQNvMnp6Pz0PfK80bVSy7YuVY73X2k9C93BzUGA.RVJXgbMe5f5uR-cS2G2HoNlbpU5q13UIgrpODwKgFw0&dib_tag=se&keywords=Billiard+Ball+Racks&qid=1747118213&s=leisure-sports-games&sr=1-23&ts_id=3397071\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">TIHOOD 6PCS Magic Ball Rack Holder Sheet</a></li>
               <li><a href=\"https://www.pooldawg.com/pool-table-accessories/standard-pool-table-accessories/pool-ball-racks/heavy-duty-wood-9-ball-rack\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Wood Heavy Duty 9 Ball Rack</a></li>
               <li><a href=\"https://www.predatorcues.com/usa/predator-pool-table-aero-rack-black.html\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Black Predator AeroRack Pool Ball Rack</a></li>
              </ul>"
                )
            },
            %{
              title: gettext("Table"),
              content:
                gettext(
                  "<p class='mb-2 text-gray-900 dark:text-gray-100'>The billiard table is where games are played. Tables vary in size and material, and are covered with a felt surface.</p>
                  <ul class='list-disc list-inside'>
               <li><a href=\"https://www.spotonbilliards.com/collections/diamond-pool-tables/products/diamond-proam-pool-table\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Diamond ProAm Pool Table</a></li>
               <li><a href=\"https://www.brunswickbilliards.com/products/allenton-7-foot-pool-table-with-ball-and-claw-leg\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Allenton 7' Pool Table with Ball & Claw Leg</a></li>
               <li><a href=\"https://www.gameworldplanet.com/collections/valley-pool-tables/products/valley-pro-cat-pool-table\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Valley Pro Cat Pool Table</a></li>
               <li><a href=\"https://www.predatorcues.com/usa/predator-apex-premier-league-edition-7-foot-pool-table.html\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Predator Apex Premier League Edition 7-Foot Pool Table</a></li>
               <li><a href=\"https://www.pooltablesplus.com/shop/pool-table-collection/olhausen-billiards/reno-pool-table/\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Olhausen Reno Pool Table</a></li>
               <li><a href=\"https://prestigebilliardsaz.com/acurra-pool-table-7-8-or-9-foot-rasson/\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Rasson Acurra Pool Table</a></li>
               <li><a href=\"https://www.sawyertwain.com/nixon-billiards-kemp-slate-pool-table-weathered-slate/\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Nixon Billiards Kemp Slate Pool Table – Weathered Slate</a></li>
               <li><a href=\"https://www.sawyertwain.com/plank-hide-saxon-steel-slate-pool-table-gunmetal-grey-finish/\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Plank & Hide Saxon Steel Slate Pool Table</a></li>
              </ul>"
                )
            },
            %{
              title: gettext("Table Cover"),
              content:
                gettext(
                  "<p class='mb-2 text-gray-900 dark:text-gray-100'>Table covers protect billiard tables from dust, spills, and sunlight when not in use.</p>
                  <ul class='list-disc list-inside'>
               <li><a href=\"https://www.cueandcase.com/products/pool-table-cover\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Pool Table Cover</a></li>
               <li><a href=\"https://seyberts.com/collections/diamond-table-accessories/products/black-duratex-fitted-covered-for-diamond-pro-am-pool-tables?variant=41787646542022\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Diamond Logo Duratex Fitted Cover For Diamond Pro Am Pool Tables</a></li>
               <li><a href=\"https://seyberts.com/products/pro-series-black-leatherette-pool-table-cover?variant=43844783898822\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Pro Series Leatherette Pool Table Cover</a></li>
               <li><a href=\"https://www.johnsonfitness.com/Brunswick-Billiards-Table-Cover-P1965.aspx?srsltid=AfmBOoqGfCVfTz1ZKgKqXiuLVbuncNNE2b-zQXdt4ZH3QNJ0mJOVPGKh\" class='hover:underline' target=\"_blank\" rel=\"noopener noreferrer\">Brunswick Billiards Table Cover</a></li>
              </ul>"
                )
            }
          ]}
          expanded={@expanded}
        />
      </div>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    data = YamlElixir.read_from_file!("priv/billiards.yaml")
    chart_data = prepare_chart_data(data["billiards"])

    # Initialize the expanded state for each section (all collapsed initially)
    expanded = Map.new(0..(length(data["billiards"]) - 1), fn index -> {index, false} end)

    {:ok, assign(socket, chart_data: chart_data, expanded: expanded)}
  end

  @impl true
  def handle_event("toggle_accordion", %{"index" => index}, socket) do
    # Toggle the expanded/collapsed state of the clicked section
    index = String.to_integer(index)
    expanded = Map.update!(socket.assigns.expanded, index, fn state -> !state end)

    {:noreply, assign(socket, expanded: expanded)}
  end

  defp prepare_chart_data(data) do
    %{
      labels: Enum.map(data, & &1["year"]),
      datasets: [
        %{
          label: "Billiards Sales",
          data: Enum.map(data, & &1["sales"]),
          backgroundColor: "rgba(75, 192, 192, 0.2)",
          borderColor: "rgba(75, 192, 192, 1)",
          borderWidth: 1
        }
      ]
    }
  end
end
