defmodule AppWeb.Components.UI.Rating do
  @moduledoc """
  Rating Element
  based on: https://flowbite.com/docs/components/rating/
  """
  use Phoenix.Component

  @doc """
  Renders a star rating. Props:
  - `value`: number of filled stars (default: 0)
  - `out_of`: total stars to display (default: 5)
  """

  # import AppWeb.Components.UI.Rating
  #<.rating value={3} out_of={5} class="ml-2" />

  attr :value, :integer, default: 0
  attr :out_of, :integer, default: 5
  attr :class, :string, default: ""

  def rating(assigns) do
    assigns =
      assigns
      |> assign(:filled_stars, Enum.to_list(1..assigns.value))
      |> assign(:empty_stars, Enum.to_list(1..(assigns.out_of - assigns.value)))

    ~H"""
    <div class={"flex items-center #{@class}"}>
      <%= for _ <- @filled_stars do %>
        <svg class="w-4 h-4 text-yellow-300 ms-1" xmlns="http://www.w3.org/2000/svg" fill="currentColor"
             viewBox="0 0 22 20" aria-hidden="true">
          <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534
            1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463
            9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11
            17.033l4.518 2.375a1.534 1.534 0 0 0
            2.226-1.617l-.863-5.03L20.537 9.2a1.523
            1.523 0 0 0 .387-1.575Z" />
        </svg>
      <% end %>

      <%= for _ <- @empty_stars do %>
        <svg class="w-4 h-4 ms-1 text-gray-300 dark:text-gray-500" xmlns="http://www.w3.org/2000/svg"
             fill="currentColor" viewBox="0 0 22 20" aria-hidden="true">
          <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534
            1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463
            9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11
            17.033l4.518 2.375a1.534 1.534 0 0 0
            2.226-1.617l-.863-5.03L20.537 9.2a1.523
            1.523 0 0 0 .387-1.575Z" />
        </svg>
      <% end %>
    </div>
    """
  end
end
