defmodule AppWeb.LicensingLive do
  use AppWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <h1 class="text-center text-4xl font-bold mb-6 text-gray-900 dark:text-white">
      {gettext("Software Licensing")}
    </h1>
    <div class="mt-8 bg-gray-100 shadow-lg rounded-xl p-6 md:p-10 dark:bg-gray-800 dark:text-gray-200">
      <div class="mt-6 space-y-6">
        <!-- MIT License Section -->
        <div class="bg-gray-200 p-6 rounded-lg dark:bg-gray-700">
          <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">
            {gettext("MIT License")}
          </h3>
          <div class="text-sm text-gray-800 dark:text-gray-300 space-y-4">
            <p>
              {gettext("Copyright © 2025 Cuesphere")}
            </p>
            <p>
              {gettext(
                "Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:"
              )}
            </p>
            <p>
              {gettext(
                "The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software."
              )}
            </p>
            <p>
              {gettext(
                "THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE."
              )}
            </p>
          </div>
        </div>

    <!-- Third-Party Licenses Section -->
        <div class="bg-gray-200 p-6 rounded-lg dark:bg-gray-700">
          <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">
            {gettext("Third-Party Licenses")}
          </h3>
          <div class="text-sm text-gray-800 dark:text-gray-300 space-y-6">
            <!-- Phoenix Framework -->
            <div>
              <h4 class="font-medium">Phoenix Framework</h4>
              <p>MIT License - Copyright (c) 2014 Chris McCord</p>
            </div>

    <!-- Tailwind CSS -->
            <div>
              <h4 class="font-medium">Tailwind CSS</h4>
              <p>MIT License - Copyright (c) Tailwind Labs, Inc.</p>
            </div>
          </div>
        </div>

    <!-- Additional Licensing Information -->
        <div class="bg-gray-200 p-6 rounded-lg dark:bg-gray-700">
          <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">
            {gettext("Additional Information")}
          </h3>
          <div class="text-sm text-gray-800 dark:text-gray-300 space-y-4">
            <p>
              {gettext(
                "For questions about licensing or to request a commercial license, please contact us at:"
              )}
            </p>
            <p class="font-medium">
              licensing@cuesphere.com
            </p>
            <p>
              {gettext(
                "All trademarks and registered trademarks are the property of their respective owners."
              )}
            </p>
          </div>
        </div>
      </div>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
