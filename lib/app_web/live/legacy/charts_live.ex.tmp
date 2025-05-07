defmodule AppWeb.ChartsLive do
  use AppWeb, :live_view

  @numbers [65, 59, 80, 81, 56, 55, 40]
  @backgroundcolor [
                "rgba(255, 99, 132, 0.2)",
                "rgba(255, 159, 64, 0.2)",
                "rgba(255, 205, 86, 0.2)",
                "rgba(75, 192, 192, 0.2)",
                "rgba(54, 162, 235, 0.2)",
                "rgba(153, 102, 255, 0.2)",
                "rgba(201, 203, 207, 0.2)"]

  @bordercolor [
              "rgb(255, 99, 132)",
              "rgb(255, 159, 64)",
              "rgb(255, 205, 86)",
              "rgb(75, 192, 192)",
              "rgb(54, 162, 235)",
              "rgb(153, 102, 255)",
              "rgb(201, 203, 207)"]

  @impl true
  def render(assigns) do
    ~H"""
    <div class="format dark:format-invert">
      <h2>Class Poll Charts</h2>
      <canvas id="my-chart" phx-hook="Chart" data-config={Jason.encode!(@config)} />
      <div class="text-center space-x-2 mt-4">
        <.button color="alternative" phx-click="regenerate">Random Question</.button>
      </div>
      <%= if @line_config do %>
      <div class="mt-8">
        <h2>Red Dead Redemption 2 Prices</h2>
        <canvas id="line-chart" phx-hook="Chart" data-config={Jason.encode!(@line_config)} />
      </div>
    <% end %>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:config, config(1))
     |> assign(:line_config, config_from_prices(fetch_game_prices("elden ring")))}
  end

  def config(0) do
    %{
      type: "bar",
      data: %{
        labels: ~w(January February March April May June July),
        datasets: [
          %{
            label: "My First Dataset",
            data: Enum.shuffle(@numbers),
            backgroundColor: @backgroundcolor,
            borderColor: @bordercolor,
            borderWidth: 1
          }
        ]
      },
      options: %{
        scales: %{
          y: %{
            beginAtZero: true
          }
        }
      }
    }
  end

  def config(1) do
    %{
      type: "bar",
      data: %{
        labels: ~w(Banana Orange Kiwi Apples Cherries Strawberries Watermelon Other),
        datasets: [
          %{
            label: "What is your favorite fruit?",
            data: [3, 1, 0, 0, 0, 9, 4, 5],
            backgroundColor: @backgroundcolor,
            borderColor: @bordercolor,
            borderWidth: 1
          }
        ]
      },
      options: %{
        plugins: %{
          title: %{
            display: true,
            text: "What is your favorite fruit?"
          }
        },
        scales: %{
          y: %{
            beginAtZero: true,
            title: %{ display: true, text: "Votes" }
          },
          x: %{
            title: %{ display: true, text: "Answer Choices" }
          }
        }
      }
    }
  end

  def config(2) do
    %{
      type: "bar",
      data: %{
        labels: ~w(Spring Summer Fall Winter),
        datasets: [
          %{
            label: "What is your favorite Season?",
            data: [6, 4, 10, 2],
            backgroundColor: @backgroundcolor,
            borderColor: @bordercolor,
            borderWidth: 1
          }
        ]
      },
      options: %{
        plugins: %{
          title: %{
            display: true,
            text: "What is your favorite season?"
          }
        },
        scales: %{
          y: %{
            beginAtZero: true,
            title: %{ display: true, text: "Votes" }
          },
          x: %{
            title: %{ display: true, text: "Answer Choices" }
          }
        }
      }
    }
  end

  def config(3) do
    %{
      type: "bar",
      data: %{
        labels: ~w(Brown Blue Green Hazel Other),
        datasets: [
          %{
            label: "What color are your eyes?",
            data: [8, 6, 2, 5, 1],
            backgroundColor: @backgroundcolor,
            borderColor: @bordercolor,
            borderWidth: 1
          }
        ]
      },
      options: %{
        plugins: %{
          title: %{
            display: true,
            text: "What color are your eyes?"
          }
        },
        scales: %{
          y: %{
            beginAtZero: true,
            title: %{ display: true, text: "Votes" }
          },
          x: %{
            title: %{ display: true, text: "Answer Choices" }
          }
        }
      }
    }
  end

  def config(4) do
      %{
        type: "bar",
        data: %{
          labels: ~w(Yes No),
          datasets: [
            %{
              label: "Are You A Morning Person?",
              data: [9, 13],
              backgroundColor: @backgroundcolor,
              borderColor: @bordercolor,
              borderWidth: 1
            }
          ]
        },
        options: %{
          plugins: %{
            title: %{
              display: true,
              text: "Are You A Morning Person?"
            }
          },
          scales: %{
            y: %{
              beginAtZero: true,
              title: %{ display: true, text: "Votes" }
            },
            x: %{
              title: %{ display: true, text: "Answer Choices" }
            }
          }
        }
      }
    end

    def config(5) do
      %{
        type: "bar",
        data: %{
          labels: ~w(Dog Cat Bird Fish Other),
          datasets: [
            %{
              label: "What is your favorite pet?",
              data: [13, 4, 3, 2, 0],
              backgroundColor: @backgroundcolor,
              borderColor: @bordercolor,
              borderWidth: 1
            }
          ]
        },
        options: %{
          plugins: %{
            title: %{
              display: true,
              text: "What is your favorit pet?"
            }
          },
          scales: %{
            y: %{
              beginAtZero: true,
              title: %{ display: true, text: "Votes" }
            },
            x: %{
              title: %{ display: true, text: "Answer Choices" }
            }
          }
        }
      }
    end

  def fetch_game_prices(_title) do
    url = "https://www.cheapshark.com/api/1.0/deals?title=RedDeadRedemption2"

    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
        |> Jason.decode!()
        |> Enum.map(fn deal -> String.to_float(deal["salePrice"]) end)

      _ ->
        [0.0]  # fallback dummy data
    end
  end

  def config_from_prices(prices) do
    %{
      type: "line",
      data: %{
        labels: Enum.map(1..length(prices), fn i -> "Store #{i}" end),
        datasets: [
          %{
            label: "Game Prices (USD)",
            data: prices,
            fill: false,
            borderColor: "rgb(75, 192, 192)",
            backgroundColor: "rgba(75, 192, 192, 0.2)",
            tension: 0.1
          }
        ]
      },
      options: %{
        responsive: true,
        plugins: %{
          title: %{
            display: true,
            text: "Current Game Prices from CheapShark"
          }
        },
        scales: %{
          y: %{
            beginAtZero: true,
            title: %{ display: true, text: "Price (USD)" }
          },
          x: %{
            title: %{ display: true, text: "Store" }
          }
        }
      }
    }
  end

  @impl true
  def handle_event("regenerate", _params, socket) do
    nums = Enum.random(1..5)
    {:noreply, assign(socket, :config, config(nums))}
  end
end
