defmodule AppWeb.Components.UI.Button do
  @moduledoc """
  Flowbite Button
  based on: https://flowbite.com/docs/components/buttons/

  Currently only supports
  - default button style (rounded corners)
  - colors [default, alternative]
  - sizes
  - leading icons
  """
  use Phoenix.Component

  use Phoenix.VerifiedRoutes,
    endpoint: AppWeb.Endpoint,
    router: AppWeb.Router,
    statics: AppWeb.static_paths()

  import AppWeb.Components.UI.Icon

  @doc """
  Renders a styled button.

  ## Examples

      <.button color="alternative" size="xl">Test</.button>
      <.button icon="plus">Test</.button>
  """
  attr :class, :string, default: nil
  attr :color, :string, default: "default", values: ~w(default alternative menu)
  attr :icon, :string, default: nil, doc: "Use at least md size."
  attr :trailing, :boolean, default: false, doc: "Is the icon trailing (true), or leading (false)"
  attr :size, :string, default: "md", values: ~w(xs sm md lg xl)
  attr :style, :string, default: "normal", values: ~w(normal menu)
  attr :patch, :string, default: nil
  attr :navigate, :string, default: nil
  attr :href, :string, default: nil
  attr :method, :string, default: nil

  attr :type, :string, default: "button", values: ["button", "submit"]
  attr :rest, :global, default: %{}, include: ~w(disabled name value)

  slot :inner_block

  def button(%{style: "menu"} = assigns) do
    ~H"""
    <%= if @patch || @navigate || @href do %>
      <.link
        patch={@patch}
        navigate={@navigate}
        href={@href}
        method={@method}
        class={[
          "flex items-center justify-between w-full py-2 px-3 text-gray-900 hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 md:w-auto dark:text-white md:dark:hover:text-blue-500 dark:focus:text-white dark:hover:bg-gray-700 md:dark:hover:bg-transparent",
          @class
        ]}
        {@rest}
      >
        {render_slot(@inner_block)}
      </.link>
    <% else %>
      <button
        type={@type}
        class={[
          "flex items-center justify-between w-full py-2 px-3 text-gray-900 hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 md:w-auto dark:text-white md:dark:hover:text-blue-500 dark:focus:text-white dark:hover:bg-gray-700 md:dark:hover:bg-transparent",
          @class
        ]}
        {@rest}
      >
        {render_slot(@inner_block)}
      </button>
    <% end %>
    """
  end

  def button(%{style: "normal"} = assigns) do
    ~H"""
    <%= if @patch || @navigate || @href do %>
      <.link
        patch={@patch}
        navigate={@navigate}
        href={@href}
        method={@method}
        class={[
          "font-medium focus:outline-none focus:ring-4 rounded-lg disabled:cursor-not-allowed",
          color_classes(@color),
          size_classes(@size),
          @icon && "inline-flex items-center justify-center group",
          @class
        ]}
        {@rest}
      >
        <.icon
          :if={@icon}
          name={@icon}
          class={Enum.join(["mr-2", icon_size_classes(@size), icon_color_classes(@color)], " ")}
        />
        {render_slot(@inner_block)}
      </.link>
    <% else %>
      <button
        type={@type}
        class={[
          "font-medium focus:outline-none focus:ring-4 rounded-lg disabled:cursor-not-allowed",
          color_classes(@color),
          size_classes(@size),
          @icon && "inline-flex items-center justify-center group",
          @class
        ]}
        {@rest}
      >
        <.icon
          :if={@icon}
          name={@icon}
          class={Enum.join(["mr-2", icon_size_classes(@size), icon_color_classes(@color)], " ")}
        />
        {render_slot(@inner_block)}
      </button>
    <% end %>
    """
  end

  def button(%{style: "user-menu"} = assigns) do
    ~H"""
    <button
      type="button"
      class={[
        "rounded-full focus:ring-4 focus:ring-gray-300 dark:focus:ring-gray-600",
        @class
      ]}
      {@rest}
    >
      <span class="sr-only">Open user menu</span>
      {render_slot(@inner_block)}
    </button>
    """
  end

  defp size_classes("xs"), do: "px-3 py-2 text-xs"
  defp size_classes("sm"), do: "px-3 py-2 text-sm"
  defp size_classes("md"), do: "px-5 py-2.5 text-sm"
  defp size_classes("lg"), do: "px-5 py-3 text-base"
  defp size_classes("xl"), do: "px-6 py-3.5 text-base"

  defp icon_size_classes("xs"), do: "w-3 h-3"
  defp icon_size_classes("sm"), do: "w-3.5 h-3.5"
  defp icon_size_classes("md"), do: "w-3.5 h-3.5"
  defp icon_size_classes("lg"), do: "w-4 h-4"
  defp icon_size_classes("xl"), do: "w-4 h-4"

  defp color_classes("default") do
    "text-white bg-blue-700 hover:bg-blue-800 focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
  end

  defp color_classes("alternative") do
    "text-white bg-gray-400 hover:bg-gray-600 focus:z-10 focus:ring-gray-100 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-100 dark:border-gray-400 dark:hover:bg-gray-400"
  end

  defp icon_color_classes("default"), do: "text-white"

  defp icon_color_classes("alternative") do
    "text-gray-900 dark:text-gray-400 group-hover:text-blue-700 dark:group-hover:text-white"
  end

  @doc """
Creates a button to switch between locales.

  ## Examples
    <.language_toggle locale={@locale} />
"""
# attr :locale, :string, required: true, values: ~w(es en)

def language_toggle(assigns) do
  ~H"""
  <.link
    :if={@locale == "en"}
    type="button"
    class="rounded-full size-6 block"
    href={~p"/locale/es"}
    method="PUT"
  >
    <span class="sr-only">Switch to Espanol</span>
    <svg
      aria-hidden="true"
      class="size-6 rounded-full"
      xmlns:xlink="http://www.w3.org/1999/xlink"
      viewBox="0 0 3900 3900"
    >
      <path fill="#b22234" d="M0 0h7410v3900H0z" />
      <path
        d="M0 450h7410m0 600H0m0 600h7410m0 600H0m0 600h7410m0 600H0"
        stroke="#fff"
        stroke-width="300"
      />
      <path fill="#3c3b6e" d="M0 0h2964v2100H0z" />
      <g fill="#fff">
        <g id="d">
          <g id="c">
            <g id="e">
              <g id="b">
                <path id="a" d="M247 90l70.534 217.082-184.66-134.164h228.253L176.466 307.082z" />
                <use xlink:href="#a" y="420" />
                <use xlink:href="#a" y="840" />
                <use xlink:href="#a" y="1260" />
              </g>
              <use xlink:href="#a" y="1680" />
            </g>
            <use xlink:href="#b" x="247" y="210" />
          </g>
          <use xlink:href="#c" x="494" />
        </g>
        <use xlink:href="#d" x="988" />
        <use xlink:href="#c" x="1976" />
        <use xlink:href="#e" x="2470" />
      </g>
    </svg>
  </.link>

  <%!-- <.link
    :if={@locale == "de"}
    class="rounded-full size-6 block"
    type="button"
    href={~p"/locale/en"}
    method="PUT"
  >
    <span class="sr-only">English (US)</span>
    <svg aria-hidden="true" class="size-6 rounded-full" viewBox="0 0 512 512">
      <path fill="#ffce00" d="M0 341.3h512V512H0z" />
      <path d="M0 0h512v170.7H0z" />
      <path fill="#d00" d="M0 170.7h512v170.6H0z" />
    </svg>
  </.link> --%>



  <.link
    :if={@locale == "es"}
    class="rounded-full size-6 block"
    type="button"
    href={~p"/locale/en"}
    method="PUT"
  >
    <span class="sr-only">Switch to English</span>
    <svg aria-hidden="true" class="size-6 rounded-full" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" role="img" preserveAspectRatio="xMidYMid meet">
      <path d="M2 32c0 5.9 1.7 11.4 4.6 16h50.7c2.9-4.6 4.6-10.1 4.6-16s-1.7-11.4-4.6-16H6.6C3.7 20.6 2 26.1 2 32z" fill="#ffce31"></path>
      <g fill="#ed4c5c">
        <path d="M57.4 16C52.1 7.6 42.7 2 32 2S11.9 7.6 6.6 16h50.8z"></path>
        <path d="M6.6 48c5.3 8.4 14.7 14 25.4 14s20.1-5.6 25.4-14H6.6z"></path>
      </g>
      <g fill="#c8b100">
        <path d="M9.2 28.7h3.2v1.8H9.2z"></path>
        <path d="M9.2 41.9h3.3v1.7H9.2z"></path>
      </g>
      <path d="M8.9 39.1c-.3.2-.5.4-.5.5c0 .1.1.2.3.3c.2.1.4.3.3.5c.2-.2.3-.4.3-.6c0-.3-.2-.6-.4-.7" fill="#ed4c5c"></path>
      <path fill="#ffffff" d="M9.7 30.5H12v11.4H9.7z"></path>
      <g fill="#ed4c5c">
        <path d="M14.4 34.7c-.5-.2-1.4-.4-2.4-.4c-.3 0-.7 0-1.1.1c-1.4.2-2.5.8-2.4 1.2L8 34.5c-.1-.5 1.1-1.1 2.6-1.4c.5-.1 1-.1 1.4-.1c1 0 1.9.1 2.4.3v1.4"></path>
        <path d="M9.7 36.2c-.6 0-1.1-.2-1.1-.5c0-.2.2-.5.6-.7h.6l-.1 1.2"></path>
        <path d="M12 35.3c.4.1.7.2.9.3c.1.1-.3.5-.9.8v-1.1"></path>
        <path d="M8.2 38.4c-.1-.2.6-.6 1.5-.9c.4-.1.7-.3 1.2-.5c1.2-.5 2.2-1.2 2-1.4l.2 1.2c.1.2-.7.8-1.9 1.4c-.4.2-1.1.5-1.5.6c-.7.2-1.3.6-1.3.7l-.2-1.1"></path>
      </g>
      <g fill="#c8b100">
        <path d="M30.7 28.7h3.2v1.8h-3.2z"></path>
        <path d="M30.6 41.9h3.3v1.7h-3.3z"></path>
      </g>
      <path d="M34.2 39.1c.3.2.5.4.5.5c0 .1-.1.2-.3.3c-.2.2-.4.5-.3.6c-.2-.2-.3-.4-.3-.6c0-.4.2-.7.4-.8" fill="#ed4c5c"></path>
      <path fill="#ffffff" d="M31.1 30.5h2.3v11.4h-2.3z"></path>
      <g fill="#ed4c5c">
        <path d="M28.7 34.7c.5-.2 1.4-.4 2.4-.4c.3 0 .7 0 1.1.1c1.4.2 2.5.8 2.4 1.2l.5-1.2c.1-.5-1.1-1.1-2.6-1.4h-1.4c-1 0-1.9.1-2.4.3v1.4"></path>
        <path d="M33.4 36.2c.6 0 1.1-.2 1.1-.5c0-.2-.2-.5-.6-.7h-.6l.1 1.2"></path>
        <path d="M31.1 35.3c-.4.1-.7.2-.9.3c-.1.1.3.5.9.8v-1.1"></path>
        <path d="M34.9 38.4c.1-.2-.6-.6-1.5-.9c-.4-.1-.7-.3-1.2-.5c-1.2-.5-2.2-1.2-2-1.4l-.2 1.2c-.1.2.7.8 1.9 1.4c.4.2 1.1.5 1.5.6c.7.2 1.3.7 1.2.8l.3-1.2"></path>
        <path d="M21.5 22.3c1.9 0 5.8.4 7.2 1.8c-1.5 3.6-3.9 2.1-7.2 2.1c-3.2 0-5.7 1.5-7.2-2.1c1.4-1.4 5.2-1.8 7.2-1.8"></path>
      </g>
      <g fill="#c8b100">
        <path d="M26.4 26.3c-1.2-.7-3-.8-4.9-.8c-1.9 0-3.7.2-4.9.8L17 28c1.1.3 2.7.5 4.5.5c1.8 0 3.3-.2 4.5-.5l.4-1.7"></path>
        <path d="M28.1 22c-.4-.3-1.2-.6-1.9-.6c-.3 0-.6 0-.9.1c0 0-.6-.8-2-.8c-.5 0-.9.1-1.3.3v-.1c-.1-.2-.3-.4-.5-.4s-.5.3-.5.5v.1c-.4-.2-.8-.3-1.3-.3c-1.4 0-2 .9-2 .8c-.3-.1-.6-.1-.9-.1c-4.6 0-2.3 3.1-2.3 3.1l.5-.6c-1.1-1.4-.1-2.2 1.9-2.2c.3 0 .5 0 .7.1c-.7 1 .6 1.9.6 1.9l.3-.5c-.7-.5-.8-2.2 1.2-2.2c.5 0 .9.1 1.3.4c0 .1-.1 1.5-.2 1.7l.8.7l.8-.7c-.1-.3-.2-1.6-.2-1.7c.3-.2.8-.4 1.3-.4c2.1 0 2.1 1.7 1.2 2.2l.3.5s1.1-.9.6-1.9c.2 0 .5-.1.7-.1c2.4 0 2.5 1.8 1.9 2.2l.4.6c-.2 0 .9-1.4-.5-2.6"></path>
      </g>
      <path d="M20.9 20.1c0-.3.3-.6.6-.6c.4 0 .6.3.6.6s-.3.6-.6.6s-.6-.3-.6-.6" fill="#005bbf"></path>
      <path fill="#c8b100" d="M21.3 18.4v.3H21v.3h.3v1h-.4v.3h1.2l.1-.2l-.1-.1h-.4v-1h.3v-.3h-.3v-.3z"></path>
      <path d="M21.5 28.3c-1.6 0-3-.2-4.1-.5c1.1-.3 2.5-.5 4.1-.5c1.6 0 3 .2 4.1.5c-1 .3-2.5.5-4.1.5" fill="#ed4c5c"></path>
      <g fill="#ffffff">
        <path d="M21.6 45.6c-1.9 0-3.7-.5-5.3-1.2c-1.2-.6-1.9-1.7-1.9-3v-4.8h14.4v4.8c0 1.3-.8 2.5-1.9 3c-1.6.8-3.4 1.2-5.3 1.2"></path>
        <path d="M21.5 28.6h7.2v8h-7.2z"></path>
      </g>
      <path d="M21.6 41.4c0 1.9-1.6 3.4-3.6 3.4s-3.6-1.5-3.6-3.4v-4.8h7.2v4.8" fill="#ed4c5c"></path>
      <g fill="#c8b100">
        <path d="M15.9 44.2c.2.1.5.3.9.4v-8.2H16l-.1 7.8"></path>
        <path d="M14.3 41.3c0 1 .4 1.8.8 2.2v-7.1h-.8v4.9"></path>
      </g>
      <path d="M17.5 44.8h.8v-8.4h-.8v8.4" fill="#c7b500"></path>
      <path d="M19.1 44.6c.3-.1.7-.3.9-.4v-7.8h-.8l-.1 8.2" fill="#c8b100"></path>
      <path fill="#ed4c5c" d="M14.3 28.6h7.2v8h-7.2z"></path>
      <path d="M20.8 43.5c.4-.3.7-1 .8-1.8v-5.2h-.8v7" fill="#c8b100"></path>
      <g fill="#ed4c5c">
        <path d="M28.8 36.6v4.8c0 1.9-1.6 3.4-3.6 3.4s-3.6-1.5-3.6-3.4v-4.8h7.2"></path>
        <path d="M26.2 30c.3.6.3 2.1-.6 1.8c.2.1.3.8.6 1.2c.5.6 1.1.1 1-.6c-.2-1.1-.1-1.8.1-2.9c0 .1.5.1.7-.1c-.1.3-.2.7 0 .7c-.2.3-.7.8-.8 1.1c-.1.7 1 2-.2 2.3c-.8.2-.3.8 0 1.1c0 0-.4 1.3-.2 1.2c-.8.3-.6-.4-.6-.4c.4-1.2-.7-1.3-.6-1.5c-1-.1.1.9-.8.9c-.2 0-.6.2-.6.2c-1.1-.1-.5-1.1-.1-1c.3.1.6.6.6-.1c0 0-.5-.8.8-.8c-.5 0-.8-.4-1-.9c-.2.1-.5.6-1.6.7c0 0-.3-1.1 0-.9c.4.2.6.2 1-.2c-.2-.3-1.4-.7-1.2-1.4c0-.2.6-.5.6-.5c-.1.5.2 1 .8 1c.8.1.5-.2.6-.4c.1-.2.7.1.5-.4c0-.1-.7-.2-.5-.5c.4-.5 1-.1 1.5.4"></path>
        <path d="M21.6 44.6l-.2-.5l.2-.6l.2.6l-.2.5"></path>
      </g>
      <g fill="#c8b100">
        <path d="M16.5 30.3v.5h.2v.4h-.5v1h.3v2.2h-.6v1.1H20v-1.1h-.5v-2.2h.2v-1h-.5v-.4h.3v-.5h-1v.5h.2v.4h-.5V30h.3v-.5h-1.1v.5h.3v1.2h-.5v-.4h.2v-.5z"></path>
        <path d="M27.8 42.6v-5h-5.2v5l2.4 1.1h.3l2.5-1.1M25 38v1.7L23.3 38H25m-2.1.1l2 2l-2 2v-4m.2 4.4l1.9-1.9v2.8l-1.9-.9m2.2.8v-2.8l1.9 1.9l-1.9.9m2.1-1.2l-2-2l2-2v4M25.3 38H27l-1.7 1.7V38"></path>
      </g>
      <path d="M19.2 36.5c0-1.5 1-2.6 2.3-2.6s2.3 1.2 2.3 2.6c0 1.4-1 2.6-2.3 2.6s-2.3-1.1-2.3-2.6" fill="#ed4c5c"></path>
      <path d="M19.9 36.5c0-1.1.7-1.9 1.6-1.9c.9 0 1.6.9 1.6 1.9c0 1.1-.7 1.9-1.6 1.9c-.8.1-1.6-.8-1.6-1.9" fill="#005bbf"></path>
      <g fill="#c8b100">
        <path d="M20.8 35.2l-.4 1.1l.3.1l-.2.4h.6l-.2-.4l.3-.1l-.4-1.1"></path>
        <path d="M22.3 35.2l-.4 1.1l.3.1l-.2.4h.6l-.1-.4l.3-.1l-.5-1.1"></path>
        <path d="M21.6 36.5l-.5 1.1l.3.1l-.1.4h.5l-.1-.4l.3-.1l-.4-1.1"></path>
      </g>
    </svg>
  </.link>
  """
end
end
