defmodule AppWeb.PurchaseLive do
  use AppWeb, :live_view
  alias YamlElixir
  import AppWeb.Components.UI.Accordion
  use Gettext, backend: AppWeb.Gettext

  @impl true
  def render(assigns) do
    ~H"""
    <div class="container mx-auto px-4 py-8">
      <h1 class="text-4xl font-bold text-center mb-6">{gettext("Purchase Billiards Equipment")}</h1>

      <!-- Chart Section -->
      <div class="bg-white dark:bg-gray-700 dark:text-white shadow-lg rounded-lg p-6 mb-6">
        <p class="text-lg text-gray-700 dark:text-white mb-4">
          {gettext("This chart demonstrates the increase in sales of billiards equipment in recent years. It highlights the growing demand for high-quality equipment and the rising popularity of billiards as a sport. Below the chart, you'll find more information about billiards equipment, along with links to purchase these items.")}
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
                    text: gettext("Billiards Equipment Sales in the U.S. by Year in Millions"),
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
                "<p class='mb-2 text-gray-500 dark:text-gray-400'>Flowbite is an open-source library of interactive components built on Tailwind CSS.</p>"
            },
            %{
              title: gettext("Bridge"),
              content:
                "<p class='text-gray-500 dark:text-gray-400'>Check out the <a href='https://flowbite.com/figma/' class='text-blue-600 dark:text-blue-500 hover:underline'>Figma design system</a>.</p>"
            },
            %{
              title: gettext("Case"),
              content:
                "<p class='text-gray-500 dark:text-gray-400'>Check out the <a href='https://flowbite.com/figma/' class='text-blue-600 dark:text-blue-500 hover:underline'>Figma design system</a>.</p>"
            },
            %{
              title: gettext("Chalk"),
              content:
                "<p class='text-gray-500 dark:text-gray-400'>Check out the <a href='https://flowbite.com/figma/' class='text-blue-600 dark:text-blue-500 hover:underline'>Figma design system</a>.</p>"
            },
            %{
              title: gettext("Cleaner"),
              content:
                "<p class='text-gray-500 dark:text-gray-400'>Check out the <a href='https://flowbite.com/figma/' class='text-blue-600 dark:text-blue-500 hover:underline'>Figma design system</a>.</p>"
            },
            %{
              title: gettext("Cue Stick"),
              content:
                "<p class='text-gray-500 dark:text-gray-400'>Check out the <a href='https://flowbite.com/figma/' class='text-blue-600 dark:text-blue-500 hover:underline'>Figma design system</a>.</p>"
            },
            %{
              title: gettext("Extension"),
              content:
                "<p class='text-gray-500 dark:text-gray-400'>Check out the <a href='https://flowbite.com/figma/' class='text-blue-600 dark:text-blue-500 hover:underline'>Figma design system</a>.</p>"
            },
            %{
              title: gettext("Glove"),
              content:
                "<p class='text-gray-500 dark:text-gray-400'>Check out the <a href='https://flowbite.com/figma/' class='text-blue-600 dark:text-blue-500 hover:underline'>Figma design system</a>.</p>"
            },
            %{
              title: gettext("Light"),
              content:
                "<p class='text-gray-500 dark:text-gray-400'>Check out the <a href='https://flowbite.com/figma/' class='text-blue-600 dark:text-blue-500 hover:underline'>Figma design system</a>.</p>"
            },
            %{
              title: gettext("Powder"),
              content:
                "<p class='text-gray-500 dark:text-gray-400'>Check out the <a href='https://flowbite.com/figma/' class='text-blue-600 dark:text-blue-500 hover:underline'>Figma design system</a>.</p>"
            },
            %{
              title: gettext("Rack"),
              content:
                "<p class='text-gray-500 dark:text-gray-400'>Check out the <a href='https://flowbite.com/figma/' class='text-blue-600 dark:text-blue-500 hover:underline'>Figma design system</a>.</p>"
            },
            %{
              title: gettext("Table"),
              content:
                "<p class='text-gray-500 dark:text-gray-400'>Check out the <a href='https://flowbite.com/figma/' class='text-blue-600 dark:text-blue-500 hover:underline'>Figma design system</a>.</p>"
            },
            %{
              title: gettext("Table Cover"),
              content:
                "<p class='text-gray-500 dark:text-gray-400'>Check out the <a href='https://flowbite.com/figma/' class='text-blue-600 dark:text-blue-500 hover:underline'>Figma design system</a>.</p>"
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
