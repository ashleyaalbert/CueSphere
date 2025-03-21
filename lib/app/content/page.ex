defmodule App.Content.Page do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pages" do
    field :content, :string
    belongs_to :topic, App.Content.Topic

    many_to_many :tags, App.Content.Tag, join_through: "pages_tags"

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(page, attrs) do
    page
    |> cast(attrs, [:content, :topic_id])
    |> validate_required([:content, :topic_id])
    |> foreign_key_constraint(:topic_id)
    |> cast_assoc(:tags,
      with: &App.Content.Tag.changeset/2,
      sort_param: :tags_sort,
      drop_param: :tags_drop
    )
  end
end
