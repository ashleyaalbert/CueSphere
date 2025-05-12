defmodule AppWeb.Components.UI.Accordion do
  use Phoenix.Component

  # import AppWeb.Components.UI.Accordion
  # <.accordion
  #     id="faq"
  #     multiple={true}
  #     sections={[
  #       %{
  #         title: "What is Flowbite?",
  #         content: "<p class='mb-2 text-gray-500 dark:text-gray-400'>Flowbite is an open-source library of interactive components built on Tailwind CSS.</p>"
  #       },
  #       %{
  #         title: "Is there a Figma file available?",
  #         content: "<p class='text-gray-500 dark:text-gray-400'>Check out the <a href='https://flowbite.com/figma/' class='text-blue-600 dark:text-blue-500 hover:underline'>Figma design system</a>.</p>"
  #       }
  #     ]}
  #   />

  attr :id, :string, default: "accordion-collapse"
  attr :multiple, :boolean, default: false
  attr :sections, :list, required: true, doc: "List of %{title: String.t(), content: Phoenix.HTML.Safe.t()}"
  attr :expanded, :map, required: true, doc: "Map of expanded sections"

  def accordion(assigns) do
    ~H"""
    <div id={@id} data-accordion={if @multiple, do: "collapse", else: "single"}>
      <%= for {section, index} <- Enum.with_index(@sections) do %>
        <h2 id={"#{@id}-heading-#{index}"}>
          <button
            type="button"
            class="flex items-center justify-between w-full p-4 font-medium rtl:text-right text-gray-500 border border-b-0 border-gray-200 rounded-t-xl focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-800 dark:border-gray-700 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-800 gap-3"
            phx-click="toggle_accordion"
            phx-value-index={index}
            aria-expanded={@expanded[index] |> to_string}
            aria-controls={"#{@id}-body-#{index}"}
          >
            <span><%= section.title %></span>
            <svg class="w-3 h-3 shrink-0 rotate-180" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
              <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5 5 1 1 5" />
            </svg>
          </button>
        </h2>
        <div
          id={"#{@id}-body-#{index}"}
          class={if @expanded[index], do: "block", else: "hidden"}
          aria-labelledby={"#{@id}-heading-#{index}"}
        >
          <div class="p-5 border border-b-0 border-gray-200 dark:border-gray-700 dark:bg-gray-900">
            <%= Phoenix.HTML.raw(section.content) %>
          </div>
        </div>
      <% end %>
    </div>
    """
  end
end
