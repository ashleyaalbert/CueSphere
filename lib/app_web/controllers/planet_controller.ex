defmodule AppWeb.PlanetController do
  use AppWeb, :controller

  alias App.Planets

  #random
  def random(conn, _params) do
    # planet = Enum.random(Planets.list())
    planet = App.Planets.get_random_planet()
    render(conn, :show, planet: planet)
  end

  #id first
  def index(conn, %{"id" => id}) do
    #planet = Planets.get(String.to_integer(id))
    planet = App.Planets.get_planet(id)
    render(conn, :show, planet: planet)
  end

  #all of them
  def planets(conn, _params) do
    render(conn, "list.html", planets: App.Planets.list_planets())
  end
end
