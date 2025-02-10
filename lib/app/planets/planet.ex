defmodule App.Planets.Planet do
  use Ecto.Schema

  import Ecto.Changeset

  schema "planets" do
    field :name, :string
    field :distance, :float
    field :orbital_period, :float
  end

  @required ~w(name distance orbital_period)a
  def changeset(lecture, attrs) do
    lecture
    |> cast(attrs, @required)
    |> validate_required(@required)
    |> validate_number(:distance, greater_than: 0)
    |> validate_number(:orbital_period, greater_than: 0)
  end
end
