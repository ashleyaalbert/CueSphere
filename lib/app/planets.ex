defmodule App.Planets do
  @moduledoc """
  A context to retrieve data of our solar system.

  - `distance` is the relative distance to the Sun compared to Earth's distance to the sun.
  - `orbital_period` is the time it takes for a planet to orbit the sun (in Earth years)
  """
  import Ecto.Query, warn: false

  # alias App.Repo
  alias App.Planets.Planet
  alias App.ETS

  @table :planets

  # List all planets
  def list_planets do
    if :ets.whereis(@table) == :undefined do
      []
    else
      :ets.tab2list(@table)
      |> Enum.map(fn {_id, planet} -> planet end)
    end
  end

  # List all planets sorted by name
  def list_planets(:sorted_by_name) do
    list_planets()
    |> Enum.sort_by(& &1.name)
  end

  # List all planets sorted by any field and order
  def list_planets({field, :asc}) do
    list_planets()
    |> Enum.sort_by(&Map.get(&1, field))
  end

  def list_planets({field, :desc}) do
    list_planets()
    |> Enum.sort_by(&Map.get(&1, field), :desc)
  end

  # Get planet by ID
  def get_planet(id) do
    case :ets.lookup(@table, id) do
      [{^id, planet}] -> planet
       _-> nil
    end
  end

  # Get a random planet
  def get_random_planet do
    list_planets()
    |> Enum.random()
  end

  # @planets [
  #   %{id: 1, name: "Mercury", distance: 0.39, orbital_period: 0.24},
  #   %{id: 2, name: "Venus", distance: 0.72, orbital_period: 0.61},
  #   %{id: 3, name: "Earth", distance: 1.0, orbital_period: 1.0},
  #   %{id: 4, name: "Mars", distance: 1.52, orbital_period: 1.88},
  #   %{id: 5, name: "Jupiter", distance: 5.02, orbital_period: 11.86},
  #   %{id: 6, name: "Saturn", distance: 9.54, orbital_period: 29.46},
  #   %{id: 7, name: "Uranus", distance: 19.18, orbital_period: 84.01},
  #   %{id: 8, name: "Neptune", distance: 30.06, orbital_period: 164.8}
  # ]

  # def create_planet(attrs) do
  #   %Planet{}
  #   |> Planet.changeset(attrs)
  #   |> Repo.insert()
  # end

  # def list_planets, do: Repo.all(Planet)

  # def list_planets(:sorted_by_name) do
  #   from(p in Planet, order_by: p.name)
  #   |> Repo.all()
  # end

  # def list_planets({column, order}) when order in [:asc, :desc] do
  #   from(p in Planet, order_by: [{^order, field(p, ^column)}])
  #   |> Repo.all()
  # end

  #def list, do: @planets

  # def list(:sorted_by_name) do
  #   Enum.sort_by(@planets, fn planet -> planet.name end)
  # end

  # gets a planet by it's id.
  # def get_planet(planet_id) do
  #   Repo.get(Planet, planet_id)
  # end

  # gets a planet struct randomly.
  # def get_random_planet do
  #   Planet
  #   |> Repo.all()
  #   |> Enum.random()
  # end

  # def update_planet(%Planet{} = planet, attrs) do
  #   planet
  #   |> Planet.changeset(attrs)
  #   |> Repo.update()
  # end

  # deletes a planet struct
  # def delete_planet(%Planet{} = planet) do
  #   Repo.delete(planet)
  # end

  # when testing do MIX_ENV=test mix run priv/repo/seeds.exs


  # Returns a string containing all planet names, sorted alphabetically in ascending order, separated by semicolon.

  # ## Examples
  #     Planets.names()
  #     "Earth, Jupiter, Mars, ..."

  # def names do
  #   :sorted_by_name
  #   |> list_planets()
  #   |> Enum.map(& &1.name)
  #   |> Enum.join(", ")
  # end


  #Returns a planet by id.

  ## Examples
      #Planets.get(1)
      #%{id: 1, name: "Mercury", distance: 0.39, orbital_period: 0.24}

  #def get(id), do: Enum.find(@planets, &(&1.id == id))
end
