defmodule App.Planets.Planet do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :id, :integer
    field :name, :string
    field :moons, :integer
    field :gravity, :float
    field :day, :float
  end

  @required ~w(id name moons gravity day)a
  def build!(params \\ %{}) do
    %__MODULE__{}
    |> cast(params, @required)
    |> validate_required(@required)
    |> validate_number(:gravity, greater_than: 0)
    |> validate_number(:day, greater_than: 0)
    |> apply_action(:insert)
  end
end
