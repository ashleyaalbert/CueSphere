defmodule AppWeb.PageControllerTest do
  use AppWeb.ConnCase

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

    test "styling", %{html: html} do
      assert html =~ "bg-"
      assert html =~ "rounded"
      assert html =~ "text-"
      assert html =~ "border"
    end
  end
end
