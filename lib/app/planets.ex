defmodule App.Planets do
  @moduledoc """
  A context to retrieve data of our solar system.

  - `distance` is the relative distance to the Sun compared to Earth's distance to the sun.
  - `orbital_period` is the time it takes for a planet to orbit the sun (in Earth years)
  """
  import Ecto.Query, warn: false

  alias App.Repo
  alias App.Planets.Planet

  @planets [
    %{id: 1, name: "Mercury", distance: 0.39, orbital_period: 0.24},
    %{id: 2, name: "Venus", distance: 0.72, orbital_period: 0.61},
    %{id: 3, name: "Earth", distance: 1.0, orbital_period: 1.0},
    %{id: 4, name: "Mars", distance: 1.52, orbital_period: 1.88},
    %{id: 5, name: "Jupiter", distance: 5.02, orbital_period: 11.86},
    %{id: 6, name: "Saturn", distance: 9.54, orbital_period: 29.46},
    %{id: 7, name: "Uranus", distance: 19.18, orbital_period: 84.01},
    %{id: 8, name: "Neptune", distance: 30.06, orbital_period: 164.8}
  ]

  def create_planet(attrs) do
    %Planet{}
    |> Planet.changeset(attrs)
    |> Repo.insert()
  end

  def list_planets, do: Repo.all(Planet)

  def list_planets(:sorted_by_name) do
    from(p in Planet, order_by: p.name)
    |> Repo.all()
  end

  def list, do: @planets

  def list(:sorted_by_name) do
    Enum.sort_by(@planets, fn planet -> planet.name end)
  end

  @doc """
  Returns a string containing all planet names, sorted alphabetically in ascending order, separated by semicolon.

  ## Examples
      Planets.names()
      "Earth, Jupiter, Mars, ..."
  """
  def names do
    :sorted_by_name
    |> list
    |> Enum.map(& &1.name)
    |> Enum.join(", ")
  end

  @doc """
  Returns a planet by id.

  ## Examples
      Planets.get(1)
      %{id: 1, name: "Mercury", distance: 0.39, orbital_period: 0.24}
  """
  def get(id), do: Enum.find(@planets, &(&1.id == id))
end
