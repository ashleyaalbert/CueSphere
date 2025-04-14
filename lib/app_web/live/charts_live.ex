# defmodule AppWeb.ChartsLive do
#   use AppWeb, :live_view

#   @numbers [65, 59, 80, 81, 56, 55, 40]

#   @impl true
#   def render(assigns) do
#     ~H"""
#     <div class="format dark:format-invert">
#       <h2>Chart</h2>
#     </div>
#     <canvas id="my-chart" phx-hook="Chart" data-config={Jason.encode!(@config)} />

#     <div class="text-container">
#       <.button phx-click="regenrate">Regenerate</.button>
#     </div>
#     """
#   end

#   @impl true
#   def mount(_params, _session, socket) do
#     {:ok, assign(socket, :config, config())}
#   end

#   def comfig do
#     %{
#       type: "bar",
#       data: %{
#         labels: ["January", "February", "March", "April", "May", "June", "July"],
#         datasets: [
#           %{
#             label: "My First Dataset",
#             data: Enum.shuffle(@numbers),
#             backgroundColor: [
#               "rgba(255, 99, 132, 0.2)",
#               "rgba(255, 159, 64, 0.2)",
#               "rgba(255, 205, 86, 0.2)",
#               "rgba(75, 192, 192, 0.2)",
#               "rgba(54, 162, 235, 0.2)",
#               "rgba(153, 102, 255, 0.2)",
#               "rgba(255, 99, 132, 0.2)"
#             ]
#           }
#         ]
#       },

#     }
#   end

# end
