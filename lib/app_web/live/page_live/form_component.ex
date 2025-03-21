defmodule AppWeb.PageLive.FormComponent do
  use AppWeb, :live_component

  alias App.Content

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
        <:subtitle>Use this form to manage page records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="page-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input
          field={@form[:topic_id]}
          type="select"
          label="Topic"
          options={Enum.map(@topics, &{&1.title, &1.id})}
        />

        <.input field={@form[:content]} type="text" label="Content" />

        <.inputs_for :let={ef} field={@form[:tags]}>
          <input type="hidden" name="page[tags_sort][]" value={ef.index} />
          <.input type="text" field={ef[:name]} placeholder="name" />
          <button
            type="button"
            name="page[tags_drop][]"
            value={ef.index}
            phx-click={JS.dispatch("change")}
          >
            <.icon name="x" class="w-6 h-6 relative top-2" />
          </button>
        </.inputs_for>

        <input type="hidden" name="page[tags_drop][]" />

        <button type="button" name="page[tags_sort][]" value="new" phx-click={JS.dispatch("change")}>
          add Tag
        </button>

        <%!-- <fieldset>
          <legend>Tags</legend>
          <.inputs_for field={@form[:tags]} as={tag_form}>
           <.input field={tag_form[:name]} label="Tag Name" />
          </.inputs_for>
        </fieldset> --%>

        <:actions>
          <.button type="submit" color="alternative" phx-disable-with="Saving...">Save Page</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{page: page} = assigns, socket) do
    topics = Content.list_topics()

    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Content.change_page(page))
     end)
     |> assign(:topics, topics)}
  end

  @impl true
  def handle_event("validate", %{"page" => page_params}, socket) do
    changeset = Content.change_page(socket.assigns.page, page_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"page" => page_params}, socket) do
    save_page(socket, socket.assigns.action, page_params)
  end

  defp save_page(socket, :edit, page_params) do
    case Content.update_page(socket.assigns.page, page_params) do
      {:ok, page} ->
        notify_parent({:saved, page})

        {:noreply,
         socket
         |> put_flash(:info, "Page updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_page(socket, :new, page_params) do
    case Content.create_page(page_params) do
      {:ok, page} ->
        notify_parent({:saved, page})

        {:noreply,
         socket
         |> put_flash(:info, "Page created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
