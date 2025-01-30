defmodule AppWeb.PlanetControllerTest do
  use AppWeb.ConnCase

  test "GET /planets", %{conn: conn} do
    conn = get(conn, ~p"/planets")
    assert html_response(conn, 200) =~ "All Planets' Details"
    assert html_response(conn, 200) =~ "Mercury"
    assert html_response(conn, 200) =~ "5.02"
    assert html_response(conn, 200) =~ "164.8"
  end

  test "GET /planets/random", %{conn: conn} do
    conn = get(conn, ~p"/planets/random")
    planets = App.Planets.list()
    refute html_response(conn, 200) =~ "All Planets' Details"
    assert html_response(conn, 200)
    assert Enum.any?(planets, fn planet -> html_response(conn, 200) =~ planet.name end)
  end

  test "GET /planets/:id", %{conn: conn} do
    planet = List.first(App.Planets.list())
    assert planet
    conn = get(conn, ~p"/planets/#{planet.id}")
    assert html_response(conn, 200) =~ planet.name
    refute html_response(conn, 200) =~ "All Planets' Details"
  end
end
