defmodule AppWeb.PrivacyPolicyLive do
  use AppWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <h1 class="text-center text-4xl font-bold mb-6 text-gray-900 dark:text-white">
      {gettext("Privacy Policy")}
    </h1>
    <div class="mt-8 bg-gray-100 shadow-lg rounded-xl p-6 md:p-10 dark:bg-gray-800 dark:text-gray-200">
      <div class="mt-6 space-y-8">
        <!-- Introduction -->
        <div class="bg-gray-200 p-6 rounded-lg dark:bg-gray-700">
          <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">
            {gettext("Introduction")}
          </h3>
          <div class="text-sm text-gray-800 dark:text-gray-300 space-y-4">
            <p>
              {gettext("Last Updated: ")}{DateTime.utc_now().year}
            </p>
            <p>
              {gettext(
                "We respect your privacy and are committed to protecting your personal data. This privacy policy will inform you about how we look after your personal data when you visit our website or use our services, and tell you about your privacy rights and how the law protects you."
              )}
            </p>
          </div>
        </div>

    <!-- Data Collection -->
        <div class="bg-gray-200 p-6 rounded-lg dark:bg-gray-700">
          <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">
            {gettext("Data We Collect")}
          </h3>
          <div class="text-sm text-gray-800 dark:text-gray-300 space-y-4">
            <p class="font-medium">
              {gettext(
                "We may collect, use, store and transfer different kinds of personal data about you:"
              )}
            </p>
            <ul class="list-disc pl-5 space-y-2">
              <li>{gettext("Identity Data: name, username, or similar identifier")}</li>
              <li>{gettext("Contact Data: email address")}</li>
              <li>{gettext("Technical Data: browser type and version, time zone setting")}</li>
              <li>{gettext("Usage Data: information about how you use our website and services")}</li>
            </ul>
          </div>
        </div>

    <!-- How We Use Data -->
        <div class="bg-gray-200 p-6 rounded-lg dark:bg-gray-700">
          <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">
            {gettext("How We Use Your Data")}
          </h3>
          <div class="text-sm text-gray-800 dark:text-gray-300 space-y-4">
            <p>
              {gettext(
                "We will only use your personal data when the law allows us to. Most commonly, we will use your personal data:"
              )}
            </p>
            <ul class="list-disc pl-5 space-y-2">
              <li>{gettext("To provide and maintain our service")}</li>
              <li>{gettext("To allow you to participate in interactive features")}</li>
              <li>{gettext("To provide customer support")}</li>
              <li>{gettext("To gather analysis or valuable information")}</li>
              <li>{gettext("To monitor the usage of our service")}</li>
              <li>{gettext("To detect, prevent and address technical issues")}</li>
            </ul>
          </div>
        </div>

    <!-- Data Security -->
        <div class="bg-gray-200 p-6 rounded-lg dark:bg-gray-700">
          <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">
            {gettext("Data Security")}
          </h3>
          <div class="text-sm text-gray-800 dark:text-gray-300 space-y-4">
            <p>
              {gettext(
                "We have implemented appropriate security measures to prevent your personal data from being accidentally lost, used or accessed in an unauthorized way, altered or disclosed."
              )}
            </p>
            <p>
              {gettext(
                "We limit access to your personal data to those employees, agents, contractors and other third parties who have a business need to know. They will only process your personal data on our instructions and they are subject to a duty of confidentiality."
              )}
            </p>
          </div>
        </div>

    <!-- Your Rights -->
        <div class="bg-gray-200 p-6 rounded-lg dark:bg-gray-700">
          <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">
            {gettext("Your Legal Rights")}
          </h3>
          <div class="text-sm text-gray-800 dark:text-gray-300 space-y-4">
            <p>
              {gettext(
                "Under certain circumstances, you have rights under data protection laws in relation to your personal data:"
              )}
            </p>
            <ul class="list-disc pl-5 space-y-2">
              <li>{gettext("Request access to your personal data")}</li>
              <li>{gettext("Request correction of your personal data")}</li>
              <li>{gettext("Request erasure of your personal data")}</li>
              <li>{gettext("Object to processing of your personal data")}</li>
              <li>{gettext("Request restriction of processing your personal data")}</li>
              <li>{gettext("Request transfer of your personal data")}</li>
              <li>{gettext("Right to withdraw consent")}</li>
            </ul>
            <p>
              {gettext(
                "If you wish to exercise any of these rights, please contact us at privacy@cuesphere.com"
              )}
            </p>
          </div>
        </div>

    <!-- Changes to Policy -->
        <div class="bg-gray-200 p-6 rounded-lg dark:bg-gray-700">
          <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">
            {gettext("Changes to This Policy")}
          </h3>
          <div class="text-sm text-gray-800 dark:text-gray-300 space-y-4">
            <p>
              {gettext(
                "We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and updating the \"Last Updated\" date."
              )}
            </p>
            <p>
              {gettext(
                "You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page."
              )}
            </p>
          </div>
        </div>

    <!-- Contact -->
        <div class="bg-gray-200 p-6 rounded-lg dark:bg-gray-700">
          <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">
            {gettext("Contact Us")}
          </h3>
          <div class="text-sm text-gray-800 dark:text-gray-300 space-y-4">
            <p>
              {gettext(
                "If you have any questions about this Privacy Policy, please contact us at privacy@cuesphere.com"
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
