defmodule AppWeb.TournamentsLive do
  use AppWeb, :live_view
  alias App.Tournaments
  alias App.Tournaments.Tournament
  import AppWeb.Components.UI.Modal
  import AppWeb.Components.UI.Button
  use Gettext, backend: AppWeb.Gettext

  @impl true
  def mount(_params, session, socket) do
    current_user = get_current_user(session)

    socket =
      socket
      |> assign(:current_user, current_user)
      |> assign(:tournaments, Tournaments.list_tournaments())
      |> assign(:form, to_form(Tournaments.change_tournament(%Tournament{})))
      |> allow_upload(:pictures, accept: ~w(image/jpeg image/png image/gif), max_entries: 3)

    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="flex flex-col items-center justify-center w-full h-full p-4">
      <h1 class="text-center text-4xl font-bold mb-6 text-gray-900 dark:text-white">
        {gettext("Tournaments")}
      </h1>
      <p class="text-lg text-gray-900 mb-8 dark:text-white text-center max-w-3xl">
        {gettext("Log in to join tournaments or create tournaments to play with others!")}
      </p>
      <!-- Log in for Button -->
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
      <div class="bg-gray-100 shadow-lg rounded-xl p-6 md:p-10 dark:bg-gray-800 dark:text-gray-100 w-full max-w-4xl space-y-6">
        <%= for tournament <- @tournaments do %>
          <div class="flex flex-col md:flex-row gap-6 bg-gray-200 p-6 rounded-lg dark:bg-gray-700">
            <!-- Left side - Tournament info -->
            <div class="flex-1">
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

            <!-- Right side - Image (only when present) -->
            <%= if tournament.pictures && length(tournament.pictures) > 0 do %>
              <div class="md:w-1/3 flex flex-col">
                <div class="flex-1 flex items-center justify-center bg-gray-300 dark:bg-gray-600 rounded-lg overflow-hidden">
                  <%= for picture <- tournament.pictures do %>
                    <img
                      src={"/uploads/#{picture.id}#{picture.file_ending}"}
                      alt={gettext("Tournament image")}
                      class="max-h-48 w-full object-contain rounded-lg"
                    />
                  <% end %>
                </div>
              </div>
            <% end %>
          </div>
        <% end %>
      </div>
    </div>

    <!-- Create Tournament Modal -->
    <%= if @current_user do %>
      <.modal
        id="create-tournament-modal"
        heading={gettext("Create New Tournament")}
        on_cancel={AppWeb.Components.UI.Modal.hide_modal("create-tournament-modal")}
      >
        <.form
          for={@form}
          phx-change="validate"
          phx-submit="create_tournament"
          id="tournament-form"
          class="space-y-4"
        >
          <.input field={@form[:name]} type="text" label={gettext("Name")} />
          <.input field={@form[:location]} type="text" label={gettext("Location")} />
          <.input field={@form[:date]} type="date" label={gettext("Date")} />
          <.input field={@form[:type]} type="text" label={gettext("Type")} />

          <.live_file_input upload={@uploads.pictures} />

          <section phx-drop-target={@uploads.pictures.ref}>
            <article :for={entry <- @uploads.pictures.entries} class="upload-entry">
              <figure>
                <.live_img_preview entry={entry} />
                <figcaption>{entry.client_name}</figcaption>
              </figure>

              <progress value={entry.progress} max="100">{entry.progress}%</progress>

              <button
                type="button"
                phx-click="cancel-upload"
                phx-value-ref={entry.ref}
                aria-label="cancel"
              >
                &times;
              </button>

              <p :for={err <- upload_errors(@uploads.pictures, entry)} class="alert alert-danger">
                {error_to_string(err)}
              </p>
            </article>

            <p :for={err <- upload_errors(@uploads.pictures)} class="alert alert-danger">
              {error_to_string(err)}
            </p>
          </section>

          <div class="mt-4 flex justify-end space-x-2">
            <.button
              type="button"
              color="alternative"
              phx-click={AppWeb.Components.UI.Modal.hide_modal("create-tournament-modal")}
            >
              {gettext("Cancel")}
            </.button>
            <.button
              type="submit"
              color="alternative"
              phx-click={AppWeb.Components.UI.Modal.hide_modal("create-tournament-modal")}
            >
              {gettext("Create")}
            </.button>
          </div>
        </.form>
      </.modal>
    <% end %>
    """
  end

  @impl true
  def handle_event("create_tournament", %{"tournament" => tournament_params}, socket) do
    changeset = Tournaments.change_tournament(%Tournaments.Tournament{}, tournament_params)

    if changeset.valid? do
      uploaded_files =
        consume_uploaded_entries(socket, :pictures, fn %{path: path}, entry ->
          id = Ecto.UUID.generate()

          file_ending =
            case entry.client_type do
              "image/jpeg" -> ".jpg"
              "image/png" -> ".png"
              "image/gif" -> ".gif"
            end

          dest = Path.join(Application.app_dir(:app, "priv/static/uploads"), id <> file_ending)

          # You will need to create `priv/static/uploads` for `File.cp!/2` to work.
          File.cp!(path, dest)

          %{id: id, file_ending: file_ending}
        end)

      save_tournament(socket, :new, tournament_params, uploaded_files)
    else
      {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
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

  def handle_event("cancel-upload", %{"ref" => ref}, socket) do
    {:noreply, cancel_upload(socket, :pictures, ref)}
  end

  def handle_event("validate", %{"tournament" => tournament_params}, socket) do
    changeset = Tournaments.change_tournament(%Tournament{}, tournament_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  defp error_to_string(:too_large), do: "Too large"
  defp error_to_string(:not_accepted), do: "You have selected an unacceptable file type"
  defp error_to_string(:too_many_files), do: "You have selected too many files"

  defp save_tournament(socket, :new, tournament_params, uploaded_files) do
    case Tournaments.create_tournament(
           socket.assigns.current_user,
           tournament_params,
           uploaded_files
         ) do
      {:ok, _tournament} ->
        {:noreply,
         socket
         |> assign(:form, to_form(Tournaments.change_tournament(%Tournament{})))
         |> assign(:tournaments, Tournaments.list_tournaments())
         |> put_flash(:info, "Tournament created successfully")}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp get_current_user(session) do
    case session do
      %{"user_token" => token} -> App.Accounts.get_user_by_session_token(token)
      _ -> nil
    end
  end
end
