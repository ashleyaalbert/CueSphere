defmodule AppWeb.Components.UI.Icon do
  use Phoenix.Component

  @doc """
  Renders a [Flowbite icon](https://flowbite.com/icons/).

  Size and colors of the icons can be customized by setting classes.

  ## Examples

      <.icon name="3-dots" />
      <.icon name="refresh" class="ml-1 w-3 h-3 animate-spin" />
  """
  attr :name, :string, required: true
  attr :class, :string, default: nil

  def icon(%{name: "3-dots"} = assigns) do
    ~H"""
    <svg class={@class} fill="currentColor" viewbox="0 0 20 20" aria-hidden="true">
      <path d="M6 10a2 2 0 11-4 0 2 2 0 014 0zM12 10a2 2 0 11-4 0 2 2 0 014 0zM16 12a2 2 0 100-4 2 2 0 000 4z" />
    </svg>
    """
  end

  def icon(%{name: "chevron"} = assigns) do
    ~H"""
    <svg class={@class} fill="none" viewbox="0 0 10 6" aria-hidden="true">
      <path
        stroke="currentColor"
        stroke-linecap="round"
        stroke-linejoin="round"
        stroke-width="2"
        d="m1 1 4 4 4-4"
      />
    </svg>
    """
  end

  def icon(%{name: "chevron-double-left"} = assigns) do
    ~H"""
    <svg class={@class} fill="none" viewbox="0 0 24 24" aria-hidden="true">
      <path
        stroke="currentColor"
        stroke-linecap="round"
        stroke-linejoin="round"
        stroke-width="2"
        d="m17 16-4-4 4-4m-6 8-4-4 4-4"
      />
    </svg>
    """
  end

  def icon(%{name: "chevron-double-right"} = assigns) do
    ~H"""
    <svg class={@class} fill="none" viewbox="0 0 24 24" aria-hidden="true">
      <path
        stroke="currentColor"
        stroke-linecap="round"
        stroke-linejoin="round"
        stroke-width="2"
        d="m7 16 4-4-4-4m6 8 4-4-4-4"
      />
    </svg>
    """
  end

  def icon(%{name: "close"} = assigns) do
    ~H"""
    <svg class={@class} fill="none" viewbox="0 0 14 14" aria-hidden="true">
      <path
        stroke="currentColor"
        stroke-linecap="round"
        stroke-linejoin="round"
        stroke-width="2"
        d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"
      />
    </svg>
    """
  end

  def icon(%{name: "edit"} = assigns) do
    ~H"""
    <svg class={@class} fill="currentColor" viewbox="0 0 24 24" aria-hidden="true">
      <path
        fill-rule="evenodd"
        d="M11.32 6.176H5c-1.105 0-2 .949-2 2.118v10.588C3 20.052 3.895 21 5 21h11c1.105 0 2-.948 2-2.118v-7.75l-3.914 4.144A2.46 2.46 0 0 1 12.81 16l-2.681.568c-1.75.37-3.292-1.263-2.942-3.115l.536-2.839c.097-.512.335-.983.684-1.352l2.914-3.086Z"
        clip-rule="evenodd"
      />
      <path
        fill-rule="evenodd"
        d="M19.846 4.318a2.148 2.148 0 0 0-.437-.692 2.014 2.014 0 0 0-.654-.463 1.92 1.92 0 0 0-1.544 0 2.014 2.014 0 0 0-.654.463l-.546.578 2.852 3.02.546-.579a2.14 2.14 0 0 0 .437-.692 2.244 2.244 0 0 0 0-1.635ZM17.45 8.721 14.597 5.7 9.82 10.76a.54.54 0 0 0-.137.27l-.536 2.84c-.07.37.239.696.588.622l2.682-.567a.492.492 0 0 0 .255-.145l4.778-5.06Z"
        clip-rule="evenodd"
      />
    </svg>
    """
  end

  def icon(%{name: "exclamation-circle"} = assigns) do
    ~H"""
    <svg class={@class} fill="none" viewbox="0 0 20 20" aria-hidden="true">
      <path
        stroke="currentColor"
        stroke-linecap="round"
        stroke-linejoin="round"
        stroke-width="2"
        d="M10 11V6m0 8h.01M19 10a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z"
      />
    </svg>
    """
  end

  def icon(%{name: "info-circle"} = assigns) do
    ~H"""
    <svg class={@class} fill="currentColor" viewbox="0 0 20 20" aria-hidden="true">
      <path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z" />
    </svg>
    """
  end

  def icon(%{name: "link"} = assigns) do
    ~H"""
    <svg class={@class} fill="none" viewbox="0 0 24 24" aria-hidden="true">
      <path
        stroke="currentColor"
        stroke-linecap="round"
        stroke-linejoin="round"
        stroke-width="2"
        d="M13.213 9.787a3.391 3.391 0 0 0-4.795 0l-3.425 3.426a3.39 3.39 0 0 0 4.795 4.794l.321-.304m-.321-4.49a3.39 3.39 0 0 0 4.795 0l3.424-3.426a3.39 3.39 0 0 0-4.794-4.795l-1.028.961"
      />
    </svg>
    """
  end

  def icon(%{name: "plus"} = assigns) do
    ~H"""
    <svg class={@class} fill="currentColor" viewbox="0 0 20 20" aria-hidden="true">
      <path
        clip-rule="evenodd"
        fill-rule="evenodd"
        d="M10 3a1 1 0 011 1v5h5a1 1 0 110 2h-5v5a1 1 0 11-2 0v-5H4a1 1 0 110-2h5V4a1 1 0 011-1z"
      />
    </svg>
    """
  end

  def icon(%{name: "refresh"} = assigns) do
    ~H"""
    <svg class={@class} fill="none" viewbox="0 0 24 24" aria-hidden="true">
      <path
        stroke="currentColor"
        stroke-linecap="round"
        stroke-linejoin="round"
        stroke-width="2"
        d="M17.651 7.65a7.131 7.131 0 0 0-12.68 3.15M18.001 4v4h-4m-7.652 8.35a7.13 7.13 0 0 0 12.68-3.15M6 20v-4h4"
      />
    </svg>
    """
  end

  def icon(%{name: "user-circle"} = assigns) do
    ~H"""
    <svg class={@class} fill="currentColor" viewbox="0 0 24 24" aria-hidden="true">
      <path
        fill-rule="evenodd"
        d="M12 20a7.966 7.966 0 0 1-5.002-1.756l.002.001v-.683c0-1.794 1.492-3.25 3.333-3.25h3.334c1.84 0 3.333 1.456 3.333 3.25v.683A7.966 7.966 0 0 1 12 20ZM2 12C2 6.477 6.477 2 12 2s10 4.477 10 10c0 5.5-4.44 9.963-9.932 10h-.138C6.438 21.962 2 17.5 2 12Zm10-5c-1.84 0-3.333 1.455-3.333 3.25S10.159 13.5 12 13.5c1.84 0 3.333-1.455 3.333-3.25S13.841 7 12 7Z"
        clip-rule="evenodd"
      />
    </svg>
    """
  end

  def icon(%{name: "youtube"} = assigns) do
    ~H"""
    <svg class={@class} fill="currentColor" viewbox="0 0 24 24" aria-hidden="true">
      <path
        fill-rule="evenodd"
        d="M21.7 8.037a4.26 4.26 0 0 0-.789-1.964 2.84 2.84 0 0 0-1.984-.839c-2.767-.2-6.926-.2-6.926-.2s-4.157 0-6.928.2a2.836 2.836 0 0 0-1.983.839 4.225 4.225 0 0 0-.79 1.965 30.146 30.146 0 0 0-.2 3.206v1.5a30.12 30.12 0 0 0 .2 3.206c.094.712.364 1.39.784 1.972.604.536 1.38.837 2.187.848 1.583.151 6.731.2 6.731.2s4.161 0 6.928-.2a2.844 2.844 0 0 0 1.985-.84 4.27 4.27 0 0 0 .787-1.965 30.12 30.12 0 0 0 .2-3.206v-1.516a30.672 30.672 0 0 0-.202-3.206Zm-11.692 6.554v-5.62l5.4 2.819-5.4 2.801Z"
        clip-rule="evenodd"
      />
    </svg>
    """
  end

  def icon(%{name: "hero-" <> _} = assigns) do
    ~H"""
    <span class={[@name, @class]} />
    """
  end

  def icon(%{name: name} = assigns) do
    assigns = assign(assigns, :icon_name, name)
    ~H"""
    <svg class={@class} fill="currentColor" viewBox="0 0 20 20" aria-hidden="true">
      <text x="50%" y="50%" text-anchor="middle" dominant-baseline="middle" font-size="10">
        {@icon_name}
      </text>
    </svg>
    """
  end
end
