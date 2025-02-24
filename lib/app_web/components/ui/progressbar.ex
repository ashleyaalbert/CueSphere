defmodule AppWeb.Components.UI.Progressbar do
  use Phoenix.Component

  @doc """
  Renders a progress bar.

  ## Attributes
    * `:progress` - Required integer from 0 to 100 indicating completion percentage.
    * `:color` - The color of the progress bar (default: "blue"). Accepts: "blue", "green", "red", "yellow", "gray".
    * `:label` - Optional label text shown inside the progress bar.
    * `:class` - Custom additional classes.
    * `:rest` - Global attributes for accessibility and customization.

  ## Examples

      <.progressbar progress={50} label="Loading..." color="green" />
      <.progressbar progress={80} color="red" class="my-4" />
  """

  attr :progress, :integer, required: true
  attr :color, :string, default: "blue", values: ~w(blue green red yellow gray)
  attr :label, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global

  def progressbar(assigns) do
    ~H"""
    <div class="w-full bg-gray-200 rounded-full h-4 dark:bg-gray-700" {@rest}>
      <div
        role="progressbar"
        aria-valuenow={@progress}
        aria-valuemin="0"
        aria-valuemax="100"
        style={"width: #{@progress}%; transition: width 0.3s ease-in-out;"}
        class={[
          "h-4 rounded-full flex items-center justify-center",
          @color == "blue" && "bg-blue-500",
          @color == "green" && "bg-green-500",
          @color == "red" && "bg-red-500",
          @color == "yellow" && "bg-yellow-500",
          @color == "gray" && "bg-gray-500",
          @class
        ]}
      >
        <span class="sr-only"><%= @progress %>% Complete</span>
        <%= if @label do %>
          <span class="text-xs font-medium text-white dark:text-gray-900 ml-2"><%= @label %></span>
        <% end %>
      </div>
    </div>
    """
  end
end
