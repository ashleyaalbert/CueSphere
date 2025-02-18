defmodule AppWeb.Components.UI.Button do
  use Phoenix.Component

  @doc """
  Renders a button.

  ## Examples

      <.button>Send!</.button>
      <.button phx-click="go" class="ml-2">Send!</.button>
  """
  attr :color, :string, default: "default", values: ~w(default alternative)
  attr :type, :string, default: "button"
  attr :class, :string, default: nil
  attr :rest, :global, include: ~w(disabled form name value)

  slot :inner_block, required: true

  def button(assigns) do
    ~H"""
    <button
      type={@type}
      class={[
        "py-2.5 px-5 me-2 mb-2 focus:ring-4 font-medium text-sm rounded-lg focus:outline-none",
        @color == "default" &&
          "text-white bg-blue-700 hover:bg-blue-800 focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800",
        @color == "alternative" &&
          "text-gray-900 bg-gray-200 border border-gray-400 hover:bg-gray-400 focus:z-10 focus:ring-gray-100 dark:focus:ring-gray-700 dark:bg-gray-600 dark:text-gray-100 dark:border-gray-400 dark:hover:bg-gray-400",
        @class
      ]}
      {@rest}
    >
      {render_slot(@inner_block)}
    </button>
    """
  end
end
