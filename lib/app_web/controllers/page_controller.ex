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
    render(conn, :home, layout: false)
  end

  def courses(conn, %{"slug" => slug}) when slug in ["spring_2025", "fall_2024"] do
    IO.inspect slug
    semester = slug_to_semester(slug)
    filtered_courses =
      @courses
      |> Enum.filter(fn course -> course.semester == semester end)

    render(conn, :courses, courses: filtered_courses, layout: false)
  end

  def courses(conn, %{"slug" => slug}) when slug not in ["spring_2025", "fall_2024"] do
    render(conn, "error.html", courses: [], error: "This appears to be an invalid semester!")
  end

  def courses(conn, _) do
    render(conn, :courses, courses: @courses, layout: false)
  end

  # defp slug_to_semester(slug) do
  #   slug
  #   |> String.capitalize()
  #   |> String.replace("_", " ")
  # end

end
