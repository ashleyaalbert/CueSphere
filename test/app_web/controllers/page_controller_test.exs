defmodule AppWeb.PageControllerTest do
  use AppWeb.ConnCase

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

  describe "/ contains" do
    setup %{conn: conn} do
      conn = get(conn, ~p"/")
    end

    test "typography", %{conn: conn} do
      assert html = html_response(conn, 200)
      assert html =~ "<h1"
      assert html =~ "<p"
      assert html =~ "<span"
    end

    test "a list", %{conn: conn} do
      assert html = html_response(conn, 200) =~ "<li"
    end

    test "an image", %{conn: conn} do
      assert html_response(conn, 200) =~ "<img"
    end

    test "links to /planets and /courses", %{conn: conn} do
      assert html_response(conn, 200) =~ "<a "
      assert html_response(conn, 200) =~ "href=\"courses"
      assert html_response(conn, 200) =~ "href=\"planets"
    end

    test "styling", %{conn: conn} do
      assert html_response(conn, 200) =~ "bg-"
      assert html_response(conn, 200) =~ "rounded"
      assert html_response(conn, 200) =~ "text-"
      assert html_response(conn, 200) =~ "border"
    end
  end
end
