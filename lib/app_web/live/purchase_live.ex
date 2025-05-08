defmodule AppWeb.PurchaseLive do
  use AppWeb, :live_view
  alias YamlElixir

  @impl true
  def render(assigns) do
    ~H"""
    <h>Purchase PAGE</h>
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
                text: "Billiards Equipment Sales in the U.S. by Year in Millions"
              }
            },
            scales: %{
              y: %{
                beginAtZero: true,
                title: %{ display: true, text: "Sales (in Millions USD)" }
            },
              x: %{
              title: %{ display: true, text: "Years" }
            }
            }
          }
        })
      }>
    </canvas>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    data = YamlElixir.read_from_file!("priv/billiards.yaml")
    chart_data = prepare_chart_data(data["billiards"])

    {:ok, assign(socket, chart_data: chart_data)}
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
