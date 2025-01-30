defmodule AppWeb.PageControllerTest do
  use AppWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/")
    assert html_response(conn, 200) =~ "Peace of mind from prototype to production"
  end

  test "GET /courses", %{conn: conn} do
    conn = get(conn, ~p"/courses")
    assert html_response(conn, 200) =~ "Ashley's Courses"
    assert html_response(conn, 200) =~ "Spring 2025"
    assert html_response(conn, 200) =~ "Fall 2024"
  end

  test "GET /courses/spring_2025", %{conn: conn} do
    conn = get(conn, ~p"/courses/spring_2025")
    assert html_response(conn, 200) =~ "Ashley's Courses"
    assert html_response(conn, 200) =~ "Spring 2025"
    refute html_response(conn, 200) =~ "Fall 2024"
  end

  test "GET /courses/ivalid", %{conn: conn} do
    conn = get(conn, ~p"/courses/invalid")
    refute html_response(conn, 200) =~ "Ashley's Courses"
    refute html_response(conn, 200) =~ "Spring 2025"
    refute html_response(conn, 200) =~ "Fall 2024"
    assert html_response(conn, 200) =~ "This appears to be an invalid semester!"
  end

  # test "GET /courses/invalid", %{conn: conn} do
  #   assert_raise ArgumentError, fn ->
  #     get(conn, ~p"/courses/invalid")
  #   end
  # end
end
