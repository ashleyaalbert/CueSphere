defmodule AppWeb.PageController do
  import AppWeb.PageHTML
  use AppWeb, :controller

  @courses [
    %{semester: "Spring 2025", name: ["MUSC 123", "CSCI 476", "CSCI 379", "CSCI 379"]},
    %{semester: "Fall 2024", name: ["CSCI 475", "CSCI 349", "CSCI 341", "BIOL 121"]}
  ]

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    #IO.inspect(App.Planets.list_planets())
    #IO.inspect(App.Planets.list_planets(:sorted_by_name))
    #IO.inspect(App.Planets.get_random_planet())
    render(conn, :home)
  end

  def courses(conn, %{"slug" => slug}) when slug in ["spring_2025", "fall_2024"] do
    IO.inspect slug
    semester = slug_to_semester(slug)
    filtered_courses =
      @courses
      |> Enum.filter(fn course -> course.semester == semester end)

    ~p"/"
    render(conn, :courses, courses: filtered_courses)
  end

  def courses(conn, %{"slug" => slug}) when slug not in ["spring_2025", "fall_2024"] do
    render(conn, "error.html", courses: [], error: "This appears to be an invalid semester!")
  end

  def courses(conn, _) do
    render(conn, :courses, courses: @courses)
  end

  # defp slug_to_semester(slug) do
  #   slug
  #   |> String.capitalize()
  #   |> String.replace("_", " ")
  # end

end
