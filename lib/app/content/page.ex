defmodule App.Content.Page do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pages" do
    field :content, :string
    belongs_to :topic, App.Content.Topic

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(page, attrs) do
    page
    |> cast(attrs, [:content, :topic_id])
    |> validate_required([:content, :topic_id])
    |> foreign_key_constraint(:topic_id)
  end
end
