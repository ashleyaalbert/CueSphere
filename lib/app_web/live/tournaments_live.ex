defmodule AppWeb.TournamentsLive do
  use AppWeb, :live_view
  alias App.Tournaments
  alias App.Tournaments.Tournament
  import AppWeb.Components.UI.Modal
  import AppWeb.CoreComponents
  import AppWeb.Components.UI.Button
  use Gettext, backend: AppWeb.Gettext

  @impl true
  def mount(_params, session, socket) do
    current_user = get_current_user(session)

    socket =
      socket
      |> assign(:current_user, current_user)
      |> assign(:tournaments, Tournaments.list_tournaments())
      |> assign(:changeset, Tournaments.change_tournament(%Tournament{}))

    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="flex flex-col items-center justify-center w-full h-full p-4">
      <h1 class="text-4xl font-bold text-center text-gray-700 dark:text-white mb-6">
        {gettext("Tournaments")}
      </h1>

      <p class="text-gray-700 dark:text-gray-300 text-center max-w-2xl mb-6">
        {gettext("Log in to join tournaments or create tournaments to play with others!")}
      </p>

      <%= if @current_user do %>
        <.button
          color="alternative"
          phx-click={AppWeb.Components.UI.Modal.show_modal("create-tournament-modal")}
          class="mb-6 font-bold py-2 px-4 rounded"
        >
          {gettext("Create Tournament")}
        </.button>
      <% end %>

    <!-- Tournaments List -->
      <div class="bg-white shadow-lg rounded-xl p-6 md:p-10 dark:bg-gray-800 dark:text-gray-200 w-full max-w-4xl grid gap-6">
        <%= for tournament <- @tournaments do %>
          <div class="flex flex-col bg-gray-200 p-6 rounded-lg dark:bg-gray-700">
            <h2 class="text-xl font-semibold text-gray-900 dark:text-white mb-2">
              {tournament.name}
            </h2>
            <p class="text-sm text-gray-800 dark:text-gray-300 mb-1">
              {gettext("Location: ")} {tournament.location}
            </p>
            <p class="text-sm text-gray-800 dark:text-gray-300 mb-1">
              {gettext("Date: ")} {tournament.date}
            </p>
            <p class="text-sm text-gray-800 dark:text-gray-300 mb-1">
              {gettext("Type: ")} {tournament.type}
            </p>
            <p class="text-sm text-gray-800 dark:text-gray-300 mb-4">
              {gettext("Created by: ")} {tournament.creator.email}
            </p>

            <div class="mb-4">
              <h3 class="font-semibold text-gray-800 dark:text-gray-200">{gettext("Players: ")}</h3>
              <ul class="list-disc list-inside text-sm text-gray-800 dark:text-gray-300">
                <%= for player <- tournament.players do %>
                  <li>{player.email}</li>
                <% end %>
              </ul>
            </div>

            <div class="flex flex-wrap gap-2 mt-2">
              <%= if @current_user do %>
                <%= if Tournaments.player_in_tournament?(tournament.id, @current_user.id) do %>
                  <.button
                    color="alternative"
                    phx-click="leave_tournament"
                    phx-value-tournament_id={tournament.id}
                  >
                    {gettext("Leave Tournament")}
                  </.button>
                <% else %>
                  <.button
                    color="alternative"
                    phx-click="join_tournament"
                    phx-value-tournament_id={tournament.id}
                  >
                    {gettext("Join Tournament")}
                  </.button>
                <% end %>

                <%= if tournament.creator_id == @current_user.id do %>
                  <.button
                    color="alternative"
                    phx-click="delete_tournament"
                    phx-value-tournament_id={tournament.id}
                    data-confirm="Are you sure you want to delete this tournament?"
                  >
                    {gettext("Delete Tournament")}
                  </.button>
                <% end %>
              <% end %>
            </div>
          </div>
        <% end %>
      </div>

    <!-- Create Tournament Modal -->
      <%= if @current_user do %>
        <.modal
          id="create-tournament-modal"
          heading={gettext("Create New Tournament")}
          on_cancel={AppWeb.Components.UI.Modal.hide_modal("create-tournament-modal")}
        >
          <.simple_form
            :let={f}
            for={@changeset}
            phx-submit="create_tournament"
            id="tournament-form"
            class="space-y-4"
          >
            <.input field={f[:name]} type="text" label={gettext("Name")} required />
            <.input field={f[:location]} type="text" label={gettext("Location")} required />
            <.input field={f[:date]} type="date" label={gettext("Date")} required />
            <.input field={f[:type]} type="text" label={gettext("Type")} required />

            <div class="mt-4 flex justify-end space-x-2">
              <.button
                type="button"
                color="alternative"
                phx-click={AppWeb.Components.UI.Modal.hide_modal("create-tournament-modal")}
              >
                {gettext("Cancel")}
              </.button>
              <.button type="submit" color="alternative">
                {gettext("Create")}
              </.button>
            </div>
          </.simple_form>
        </.modal>
      <% end %>
    </div>
    """
  end

  @impl true
  def handle_event("create_tournament", %{"tournament" => tournament_params}, socket) do
    case Tournaments.create_tournament(
           Map.put(tournament_params, "creator_id", socket.assigns.current_user.id)
         ) do
      {:ok, _tournament} ->
        {:noreply,
         socket
         |> put_flash(:info, "Tournament created successfully!")
         |> push_navigate(to: ~p"/tournaments")}

      {:error, changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  def handle_event("join_tournament", %{"tournament_id" => tournament_id}, socket) do
    # Convert string to integer
    tournament_id = String.to_integer(tournament_id)

    case Tournaments.add_player_to_tournament(tournament_id, socket.assigns.current_user.id) do
      {:ok, _} ->
        {:noreply,
         socket
         |> put_flash(:info, "You've joined the tournament!")
         |> assign(:tournaments, Tournaments.list_tournaments())}

      {:error, _} ->
        {:noreply, put_flash(socket, :error, "Failed to join tournament")}
    end
  end

  def handle_event("leave_tournament", %{"tournament_id" => tournament_id}, socket) do
    tournament_id = String.to_integer(tournament_id)

    case Tournaments.remove_player_from_tournament(tournament_id, socket.assigns.current_user.id) do
      {:ok, _} ->
        {:noreply,
         socket
         |> put_flash(:info, "You've left the tournament")
         |> assign(:tournaments, Tournaments.list_tournaments())}

      {:error, _} ->
        {:noreply, put_flash(socket, :error, "Failed to leave tournament")}
    end
  end

  def handle_event("delete_tournament", %{"tournament_id" => tournament_id}, socket) do
    tournament = Tournaments.get_tournament!(tournament_id)

    case Tournaments.delete_tournament(tournament, socket.assigns.current_user) do
      {:ok, _} ->
        {:noreply,
         socket
         |> put_flash(:info, "Tournament deleted successfully")
         |> assign(:tournaments, Tournaments.list_tournaments())}

      {:error, :not_authorized} ->
        {:noreply,
         socket
         |> put_flash(:error, "You can only delete tournaments you created")}
    end
  end

  defp get_current_user(session) do
    case session do
      %{"user_token" => token} -> App.Accounts.get_user_by_session_token(token)
      _ -> nil
    end
  end
end
