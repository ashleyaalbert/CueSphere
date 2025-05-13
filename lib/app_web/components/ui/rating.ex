defmodule AppWeb.Components.UI.Rating do
  @moduledoc """
  Rating Element
  based on: https://flowbite.com/docs/components/rating/
  """
  use Phoenix.Component
  use Gettext, backend: AppWeb.Gettext

  @doc """
  Renders a star rating. Props:
  - `value`: number of filled stars (default: 0)
  - `out_of`: total stars to display (default: 5)
  """

  # import AppWeb.Components.UI.Rating
  # <.rating value={3} out_of={5} class="ml-2" />

  attr :value, :float, default: 0.0
  attr :out_of, :integer, default: 5
  attr :class, :string, default: ""
  attr :show_numeric, :boolean, default: true
  attr :decimal_places, :integer, default: 2

  def rating(assigns) do
    total = max(assigns.out_of, 0)
    filled = min(max(assigns.value, 0), total) |> Float.floor() |> trunc()
    empty = total - filled

    # Format the numeric value
    numeric_value =
      assigns.value
      |> Float.round(assigns.decimal_places)
      |> to_string()
      |> String.trim_trailing(".0")
      |> String.trim_trailing(".00")

    ~H"""
    <div class={"flex items-center #{@class}"}>
      <!-- Filled stars -->
      <%= for _ <- List.duplicate(nil, filled) do %>
        <svg class="w-4 h-4 text-yellow-300 me-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
          <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
        </svg>
      <% end %>

      <!-- Empty stars -->
      <%= for _ <- List.duplicate(nil, empty) do %>
        <svg class="w-4 h-4 text-gray-300 me-1 dark:text-gray-500" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
          <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
        </svg>
      <% end %>

      <%= if @show_numeric do %>
        <p class="ms-1 text-sm font-medium text-gray-500 dark:text-gray-400">
          <%= numeric_value %>
        </p>
        <p class="ms-1 text-sm font-medium text-gray-500 dark:text-gray-400">
          {gettext("out of")}
        </p>
        <p class="ms-1 text-sm font-medium text-gray-500 dark:text-gray-400">
          <%= @out_of %>
        </p>
      <% end %>
    </div>
    """
  end
end
