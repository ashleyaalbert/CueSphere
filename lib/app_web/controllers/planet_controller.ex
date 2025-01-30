defmodule AppWeb.PlanetController do
  use AppWeb, :controller

  alias App.Planets

  #random
  def random(conn, _params) do
    planet = Enum.random(Planets.list())
    render(conn, :show, planet: planet)
  end

  #id first
  def index(conn, %{"id" => id}) do
    planet = Planets.get(String.to_integer(id))
    render(conn, :show, planet: planet)
  end

  #all of them
  def planets(conn, _params) do
    render(conn, "list.html", planets: Planets.list())
  end
end
