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
      html = html_response(conn, 200)
      %{html: html}
    end

    test "typography", %{html: html} do
      assert html =~ "<h1"
      assert html =~ "<p"
      assert html =~ "<span"
    end

    test "a list", %{html: html} do
      assert html =~ "<li"
    end

    test "an image", %{html: html} do
      assert html =~ "<img"
    end

    test "links to /planets and /courses", %{html: html} do
      assert html =~ "<a "
      assert html =~ "href=\"/courses"
      assert html =~ "href=\"/planets"
    end

    test "styling", %{html: html} do
      assert html =~ "bg-"
      assert html =~ "rounded"
      assert html =~ "text-"
      assert html =~ "border"
    end
  end
end
