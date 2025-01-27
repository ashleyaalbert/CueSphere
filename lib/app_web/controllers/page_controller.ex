defmodule AppWeb.PageController do
  use AppWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  @courses [
    %{semester: "Spring 2025", name: ["MUSC 123", "CSCI 476", "CSCI 379", "CSCI 379"]},
    %{semester: "Fall 2024", name: ["CSCI 475", "CSCI 349", "CSCI 341", "BIOL 121"]}
  ]

  def courses(conn, _) do
    render(conn, :courses, courses: @courses, layout: false)
  end

  def courses(conn, %{"slug" => slug}) do
    IO.inspect slug
    filtered_courses =
      Enum.filter(@courses, fn course ->
        String.downcase(course.semester) == String.downcase(slug)
      end)

    render(conn, :courses, courses: filtered_courses, layout: false)
  end
end
