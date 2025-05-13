defmodule App.Tournaments.Upload do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: false}
  embedded_schema do
    field :file_ending, :string
  end

  @required ~w(id file_ending)a
  def changeset(upload, attrs) do
    upload
    |> cast(attrs, @required)
    |> validate_required(@required)
    |> validate_inclusion(:file_ending, ~w(jpeg jpg png gif))
  end
end
