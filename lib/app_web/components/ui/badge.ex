defmodule AppWeb.Components.UI.Badge do
  @moduledoc """
  Badge Component
  based on: https://tailwindui.com/components/application-ui/elements/badges
  """
  use Phoenix.Component

  @colors %{
    "base" => %{
      "default" => "bg-blue-100 text-blue-800",
      "dark" => "bg-gray-100 text-gray-800",
      "red" => "bg-red-100 text-red-800",
      "green" => "bg-green-100 text-green-800",
      "yellow" => "bg-yellow-100 text-yellow-800",
      "indigo" => "bg-indigo-100 text-indigo-800",
      "purple" => "bg-purple-100 text-purple-800",
      "pink" => "bg-pink-100 text-pink-800"
    },
    "not-bordered" => %{
      "default" => "dark:bg-blue-900 dark:text-blue-300",
      "dark" => "dark:bg-gray-700 dark:text-gray-300",
      "red" => "dark:bg-red-900 dark:text-red-300",
      "green" => "dark:bg-green-900 dark:text-green-300",
      "yellow" => "dark:bg-yellow-900 dark:text-yellow-300",
      "indigo" => "dark:bg-indigo-900 dark:text-indigo-300",
      "purple" => "dark:bg-purple-900 dark:text-purple-300",
      "pink" => "dark:bg-pink-900 dark:text-pink-300"
    },
    "bordered" => %{
      "default" => "dark:text-blue-400 border-blue-400",
      "dark" => "dark:text-gray-400 border-gray-500",
      "red" => "dark:text-red-400 border-red-400",
      "green" => "dark:text-green-400 border-green-500",
      "yellow" => "dark:text-yellow-300 border-yellow-300",
      "indigo" => "dark:text-indigo-400 border-indigo-4x00",
      "purple" => "dark:text-purple-400 border-purple-400",
      "pink" => "dark:text-pink-400 border-pink-400"
    },
    "hover-not-bordered" => %{
      "default" => "hover:bg-blue-200 hover:dark:bg-green-800",
      "dark" => "hover:bg-gray-200 hover:dark:bg-gray-600",
      "red" => "hover:bg-red-200 hover:dark:bg-red-800",
      "green" => "hover:bg-green-200 hover:dark:bg-green-800",
      "yellow" => "hover:bg-yellow-200 hover:dark:bg-yellow-800",
      "indigo" => "hover:bg-indigo-200 hover:dark:bg-indigo-800",
      "purple" => "hover:bg-purple-200 hover:dark:bg-purple-800",
      "pink" => "hover:bg-pink-200 hover:dark:bg-pink-800"
    },
    "hover-bordered" => %{
      "default" => "hover:bg-blue-200 hover:dark:bg-gray-600",
      "dark" => "hover:bg-gray-200 hover:dark:bg-gray-600",
      "red" => "hover:bg-red-200 hover:dark:bg-gray-600",
      "green" => "hover:bg-green-200 hover:dark:bg-gray-600",
      "yellow" => "hover:bg-yellow-200 hover:dark:bg-gray-600",
      "indigo" => "hover:bg-indigo-200 hover:dark:bg-gray-600",
      "purple" => "hover:bg-purple-200 hover:dark:bg-gray-600",
      "pink" => "hover:bg-pink-200 hover:dark:bg-gray-600"
    },
    "button" => %{
      "default" =>
        "text-blue-400 hover:bg-blue-200 hover:text-blue-900 dark:hover:bg-blue-800 dark:hover:text-blue-300",
      "dark" =>
        "text-gray-400 hover:bg-gray-200 hover:text-gray-900 dark:hover:bg-gray-600 dark:hover:text-gray-300",
      "red" =>
        "text-red-400 hover:bg-red-200 hover:text-red-900 dark:hover:bg-red-800 dark:hover:text-red-300",
      "green" =>
        "text-green-400 hover:bg-green-200 hover:text-green-900 dark:hover:bg-green-800 dark:hover:text-green-300",
      "yellow" =>
        "text-yellow-400 hover:bg-yellow-200 hover:text-yellow-900 dark:hover:bg-yellow-800 dark:hover:text-yellow-300",
      "indigo" =>
        "text-indigo-400 hover:bg-indigo-200 hover:text-indigo-900 dark:hover:bg-indigo-800 dark:hover:text-indigo-300",
      "purple" =>
        "text-purple-400 hover:bg-purple-200 hover:text-purple-900 dark:hover:bg-purple-800 dark:hover:text-purple-300",
      "pink" =>
        "text-pink-400 hover:bg-pink-200 hover:text-pink-900 dark:hover:bg-pink-800 dark:hover:text-pink-300"
    }
  }

  @doc """
  Renders a badge span or a element.

  ## Examples

      <.badge color="indigo" class=""></.badge>
      <.badge large></.badge>
      <.badge bordered></.badge>
      <.badge pill></.badge>
      <.badge bordered href=""></.badge>
      <.badge dismiss="remove-skill" phx-target="" phx-value-value={12}></.badge>
      <.badge push="remove-skill" phx-value-id={1} phx-target={@myself}></.badge>
  """
  attr :bordered, :boolean, default: false
  attr :class, :string, default: nil
  attr :color, :string, default: "default", values: Map.keys(@colors["base"])
  attr :dismiss, :string, default: nil, doc: "A phx-click event name."
  attr :large, :boolean, default: false
  attr :pill, :boolean, default: false
  attr :href, :string, default: nil
  attr :navigate, :string, default: nil
  attr :patch, :string, default: nil
  attr :push, :string, default: nil
  attr :target, :any, default: nil
  attr :value, :any, default: nil, doc: "ID, required in combination with dismiss."
  attr :rest, :global, doc: "Does get applied to trigger element, if given, otherwise badge."

  slot :inner_block

  def badge(assigns) do
    hover? = assigns.href || assigns.navigate || assigns.patch || assigns.push

    assigns =
      assign(
        assigns,
        :class,
        [
          "px-2.5 py-0.5",
          !assigns.large && hover? && "font-semibold",
          (assigns.large || !hover?) && "font-medium",
          Map.get(@colors["base"], assigns.color),
          !assigns.bordered && Map.get(@colors["not-bordered"], assigns.color),
          assigns.bordered && Map.get(@colors["bordered"], assigns.color),
          assigns.bordered && "dark:bg-gray-700 border",
          !assigns.bordered && hover? && Map.get(@colors["hover-not-bordered"], assigns.color),
          assigns.bordered && hover? && Map.get(@colors["hover-bordered"], assigns.color),
          !assigns.large && "text-xs",
          assigns.large && "text-sm",
          !assigns.pill && "rounded-sm",
          assigns.pill && "rounded-full",
          assigns.class
        ]
        |> Enum.reject(&(!&1))
        |> Enum.join(" ")
      )

    ~H"""
    <span
      :if={!@push && !@href && !@navigate && !@patch}
      class={[
        @dismiss && "inline-flex items-center",
        @class
      ]}
      {@rest}
    >
      {render_slot(@inner_block)}
      <button
        :if={@dismiss}
        type="button"
        class={[
          "inline-flex items-center p-1 ms-2 bg-transparent rounded-xs",
          button_color_classes(@color)
        ]}
        aria-label="Remove"
        phx-click={@dismiss}
        phx-target={@target}
        phx-value-value={@value}
        {@rest}
      >
        <svg class="w-2 h-2" aria-hidden="true" fill="none" viewBox="0 0 14 14">
          <path
            stroke="currentColor"
            stroke-linecap="round"
            stroke-linejoin="round"
            stroke-width="2"
            d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"
          />
        </svg>
        <span class="sr-only">Remove badge</span>
      </button>
    </span>
    <.link
      :if={@href || @navigate || @patch}
      href={@href}
      navigate={@navigate}
      patch={@patch}
      class={@class}
      {@rest}
    >
      {render_slot(@inner_block)}
    </.link>
    <button :if={@push} type="button" phx-click={@push} class={@class} {@rest}>
      {render_slot(@inner_block)}
    </button>
    """
  end

  defp button_color_classes(color), do: Map.get(@colors["button"], color)
end
