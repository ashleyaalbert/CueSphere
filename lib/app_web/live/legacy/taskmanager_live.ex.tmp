defmodule AppWeb.TaskManagerLive do
  use AppWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <div class="container mx-auto p-4">
      <h1 class="text-2xl font-bold mb-4">Task Manager</h1>

      <div class="grid grid-cols-2 gap-4">
        <!-- Image 1 -->
        <div class="flex flex-col items-center">
          <img src="/images/img1.png" alt="Image 1" class="object-cover rounded-lg shadow-md" />
          <p class="mt-2 text-center">This is the task manager before I run anything but just have VSCode open.</p>
        </div>

        <!-- Image 2 -->
        <div class="flex flex-col items-center">
          <img src="/images/img2.png" alt="Image 2" class="object-cover rounded-lg shadow-md" />
          <p class="mt-2 text-center">This is the task manager once I run the deployed code.</p>
        </div>

        <!-- Image 3 -->
        <div class="flex flex-col items-center">
          <img src="/images/img3.png" alt="Image 3" class="object-cover rounded-lg shadow-md" />
          <p class="mt-2 text-center">This is the task manager once I run the local code.</p>
        </div>

        <!-- Image 4 -->
        <div class="flex flex-col items-center">
          <img src="/images/img4.png" alt="Image 4" class="object-cover rounded-lg shadow-md" />
          <p class="mt-2 text-center">This is the task manager when I run the binary code. I anticipated that this would have lower memory since it is binary but it does not. It has lower memory for PID 8164 and 12268.</p>
        </div>
      </div>
      <p class="mt-2 text-center">From research. the binary code should have the lowest memory footprint and be most ideal for deployment in containers or servers with limited resources. This means that we should use the binary for a cloud service provider if we want to save memory. The threads remained mostly the same across the board, except for PID 12268. The local code has the lowest amount of threads compared to the deployed code and binary code. On my end, Windows task manager is not showing much of a difference between all four images shown above, nor does it appear the way it does on Apple devices. When I try to search beam for any one of the commands, I get nothing in return. I did work with Professor Fuchsberger on this and this was the best that I could provide.</p>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
