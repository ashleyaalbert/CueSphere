defmodule AppWeb.Components.UI.Carousel do
  use Phoenix.Component
  import Phoenix.VerifiedRoutes
  @endpoint AppWeb.Endpoint
  @router AppWeb.Router
  use Gettext, backend: AppWeb.Gettext

  # The `items` param will be a list of maps with at least a `src` for image and `alt` text
  def carousel(assigns) do
    ~H"""
    <div id="default-carousel" class="relative w-full" data-carousel="slide">
      <!-- Carousel wrapper -->
      <div class="relative aspect-video overflow-hidden rounded-lg flex items-center justify-center">
        <!-- Item 1 -->
        <div class="hidden duration-1000 ease-in-out w-full h-full" data-carousel-item>
          <img
            src={~p"/images/final/pool_fullsize.jpg"}
            class="mx-auto max-h-full max-w-full object-contain"
            alt={
              gettext(
                "Ashley with her Shamokin Women's 8-ball Team. They pose for a group photo near a green-cloth pool table with two pool cues making an X on the table and an 8-ball. There are 7 women in this photo including Ashley."
              )
            }
          />
        </div>
        <!-- Item 2 -->
        <div class="hidden duration-1000 ease-in-out w-full h-full" data-carousel-item>
          <img
            src={~p"/images/final/titleholders.jpg"}
            class="mx-auto max-h-full max-w-full object-contain"
            alt={
              gettext(
                "Ashley and her all otherwise male TAP team, Pocket Pounders. Ashley stands in the center holding $2400 fanned out to show the team's win."
              )
            }
          />
        </div>
        <!-- Item 3 -->
        <div class="hidden duration-1000 ease-in-out w-full h-full" data-carousel-item>
          <img
            src={~p"/images/final/genetti.jpg"}
            class="mx-auto max-h-full max-w-full object-contain"
            alt={
              gettext(
                "Ashley and her father, Bryan, standing infront of a tall Christmas tree with their pool cue cases in the Genetti hotel."
              )
            }
          />
        </div>
        <!-- Item 4 -->
        <div class="hidden duration-1000 ease-in-out w-full h-full" data-carousel-item>
          <img
            src={~p"/images/final/newcue.jpg"}
            class="mx-auto max-h-full max-w-full object-contain"
            alt={
              gettext(
                "Ashley and her father, Bryan, standing near a grey cloth pool table while holding Ashley's new pool cue. Her new pool cue case also sits on the pool table in front of them."
              )
            }
          />
        </div>
        <!-- Item 5 -->
        <div class="hidden duration-1000 ease-in-out w-full h-full" data-carousel-item>
          <img
            src={~p"/images/final/nicole.jpg"}
            class="mx-auto max-h-full max-w-full object-contain"
            alt={
              gettext(
                "Ashley and her sister, Alyssa, stand with female pro Nicole Nester in between them in front of a blue cloth pool table at Blue Mountain Billiards."
              )
            }
          />
        </div>
        <!-- Item 6 -->
        <div class="hidden duration-1000 ease-in-out w-full h-full" data-carousel-item>
          <img
            src={~p"/images/final/westend.jpg"}
            class="mx-auto max-h-full max-w-full object-contain"
            alt={
              gettext(
                "Ashley and her father, Bryan, standing in a corner of the Shamokin West End with the pool cues vertically in hand."
              )
            }
          />
        </div>
      </div>
      <!-- Slider indicators -->
      <div class="absolute z-30 flex -translate-x-1/2 bottom-5 left-1/2 space-x-3 rtl:space-x-reverse">
        <button
          type="button"
          class="w-3 h-3 rounded-full"
          aria-current="true"
          aria-label="Slide 1"
          data-carousel-slide-to="0"
        >
        </button>
        <button
          type="button"
          class="w-3 h-3 rounded-full"
          aria-current="false"
          aria-label="Slide 2"
          data-carousel-slide-to="1"
        >
        </button>
        <button
          type="button"
          class="w-3 h-3 rounded-full"
          aria-current="false"
          aria-label="Slide 3"
          data-carousel-slide-to="2"
        >
        </button>
        <button
          type="button"
          class="w-3 h-3 rounded-full"
          aria-current="false"
          aria-label="Slide 4"
          data-carousel-slide-to="3"
        >
        </button>
        <button
          type="button"
          class="w-3 h-3 rounded-full"
          aria-current="false"
          aria-label="Slide 5"
          data-carousel-slide-to="4"
        >
        </button>
        <button
          type="button"
          class="w-3 h-3 rounded-full"
          aria-current="false"
          aria-label="Slide 6"
          data-carousel-slide-to="5"
        >
        </button>
      </div>
      <!-- Slider controls -->
      <button
        type="button"
        class="absolute top-0 start-0 z-30 flex items-center justify-center h-full px-4 cursor-pointer group focus:outline-none"
        data-carousel-prev
      >
        <span class="inline-flex items-center justify-center w-10 h-10 rounded-full bg-white/30 dark:bg-gray-800/30 group-hover:bg-white/50 dark:group-hover:bg-gray-800/60 group-focus:ring-4 group-focus:ring-white dark:group-focus:ring-gray-800/70 group-focus:outline-none">
          <svg
            class="w-4 h-4 text-white dark:text-gray-800 rtl:rotate-180"
            aria-hidden="true"
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 6 10"
          >
            <path
              stroke="currentColor"
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M5 1 1 5l4 4"
            />
          </svg>
          <span class="sr-only">Previous</span>
        </span>
      </button>
      <button
        type="button"
        class="absolute top-0 end-0 z-30 flex items-center justify-center h-full px-4 cursor-pointer group focus:outline-none"
        data-carousel-next
      >
        <span class="inline-flex items-center justify-center w-10 h-10 rounded-full bg-white/30 dark:bg-gray-800/30 group-hover:bg-white/50 dark:group-hover:bg-gray-800/60 group-focus:ring-4 group-focus:ring-white dark:group-focus:ring-gray-800/70 group-focus:outline-none">
          <svg
            class="w-4 h-4 text-white dark:text-gray-800 rtl:rotate-180"
            aria-hidden="true"
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 6 10"
          >
            <path
              stroke="currentColor"
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="m1 9 4-4-4-4"
            />
          </svg>
          <span class="sr-only">Next</span>
        </span>
      </button>
    </div>
    """
  end
end
