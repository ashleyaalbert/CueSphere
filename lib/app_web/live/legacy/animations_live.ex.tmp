defmodule AppWeb.AnimationsLive do
  use AppWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
      <div class="min-h-screen px-4 py-8 space-y-16">
        <!-- Section 1: Header and Loader -->
        <section>
          <h1 class="text-2xl font-bold mb-4">Welcome to the Animations LiveView!</h1>
          <div class="relative">
            <span class="loader"></span>
          </div>
          <br />
          <br />
          <div class="h-12"></div>
        </section>

        <section>
          <div class="relative flex justify-center">
            <div class="wrapper">
              <div class="candles">
                <div class="light__wave"></div>
                <div class="candle1">
                  <div class="candle1__body">
                    <div class="candle1__eyes">
                      <span class="candle1__eyes-one"></span>
                      <span class="candle1__eyes-two"></span>
                    </div>
                    <div class="candle1__mouth"></div>
                  </div>
                  <div class="candle1__stick"></div>
                </div>

                <div class="candle2">
                  <div class="candle2__body">
                    <div class="candle2__eyes">
                      <div class="candle2__eyes-one"></div>
                      <div class="candle2__eyes-two"></div>
                    </div>
                  </div>
                  <div class="candle2__stick"></div>
                </div>
                <div class="candle2__fire"></div>
                <div class="sparkles-one"></div>
                <div class="sparkles-two"></div>
                <div class="candle__smoke-one"></div>
                <div class="candle__smoke-two"></div>
              </div>
              <div class="floor"></div>
            </div>
          </div>
        </section>

        <section>
          <div class="relative flex justify-center">
            <div class="icon-conatiner">
              <svg
                class="custom"
                width="19px"
                height="21px"
                viewBox="0 0 19 21"
                version="1.1"
                xmlns="http://www.w3.org/2000/svg"
                xmlns:xlink="http://www.w3.org/1999/xlink"
              >
                <title>Group</title>
                <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                  <g id="Artboard" transform="translate(-142.000000, -122.000000)">
                    <g id="Group" transform="translate(142.000000, 122.000000)">
                      <path
                        d="M3.4,4 L11.5,4 L11.5,4 L16,8.25 L16,17.6 C16,19.4777681 14.4777681,21 12.6,21 L3.4,21 C1.52223185,21 6.74049485e-16,19.4777681 0,17.6 L0,7.4 C2.14128934e-16,5.52223185 1.52223185,4 3.4,4 Z"
                        id="Rectangle-Copy"
                        fill="#C4FFE4"
                      >
                      </path>
                      <path
                        d="M6.4,0 L12,0 L12,0 L19,6.5 L19,14.6 C19,16.4777681 17.4777681,18 15.6,18 L6.4,18 C4.52223185,18 3,16.4777681 3,14.6 L3,3.4 C3,1.52223185 4.52223185,7.89029623e-16 6.4,0 Z"
                        id="Rectangle"
                        fill="#85EBBC"
                      >
                      </path>
                      <path
                        d="M12,0 L12,5.5 C12,6.05228475 12.4477153,6.5 13,6.5 L19,6.5 L19,6.5 L12,0 Z"
                        id="Path-2"
                        fill="#64B18D"
                      >
                      </path>
                    </g>
                  </g>
                </g>
              </svg>
              <svg
                class="custom"
                width="19px"
                height="21px"
                viewBox="0 0 19 21"
                version="1.1"
                xmlns="http://www.w3.org/2000/svg"
                xmlns:xlink="http://www.w3.org/1999/xlink"
              >
                <title>Group</title>
                <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                  <g id="Artboard" transform="translate(-142.000000, -122.000000)">
                    <g id="Group" transform="translate(142.000000, 122.000000)">
                      <path
                        d="M3.4,4 L11.5,4 L11.5,4 L16,8.25 L16,17.6 C16,19.4777681 14.4777681,21 12.6,21 L3.4,21 C1.52223185,21 6.74049485e-16,19.4777681 0,17.6 L0,7.4 C2.14128934e-16,5.52223185 1.52223185,4 3.4,4 Z"
                        id="Rectangle-Copy"
                        fill="#C4FFE4"
                      >
                      </path>
                      <path
                        d="M6.4,0 L12,0 L12,0 L19,6.5 L19,14.6 C19,16.4777681 17.4777681,18 15.6,18 L6.4,18 C4.52223185,18 3,16.4777681 3,14.6 L3,3.4 C3,1.52223185 4.52223185,7.89029623e-16 6.4,0 Z"
                        id="Rectangle"
                        fill="#85EBBC"
                      >
                      </path>
                      <path
                        d="M12,0 L12,5.5 C12,6.05228475 12.4477153,6.5 13,6.5 L19,6.5 L19,6.5 L12,0 Z"
                        id="Path-2"
                        fill="#64B18D"
                      >
                      </path>
                    </g>
                  </g>
                </g>
              </svg>
            </div>
            <div class="text">long press me</div>
          </div>
        </section>

        <section>
          <div class="relative flex justify-center">
            <div class="pendulum">
              <div class="pendulum_box">
                <div class="ball first"></div>
                <div class="ball"></div>
                <div class="ball"></div>
                <div class="ball"></div>
                <div class="ball last"></div>
              </div>
            </div>
          </div>
        </section>


        <section>
          <div class="bar-container">
            <div class="bar-1"></div>
            <div class="bar-2"></div>
            <div class="bar-3"></div>
            <div class="bar-4"></div>
            <div class="bar-5"></div>
            <div class="bar-6"></div>
            <div class="bar-7"></div>
            <div class="bar-8"></div>
          </div>
        </section>
      </div>
    """
  end
end
