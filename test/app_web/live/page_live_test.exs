defmodule AppWeb.PageLiveTest do
  use AppWeb.ConnCase

  import Phoenix.LiveViewTest
  import App.ContentFixtures
  import App.AccountsFixtures

  @create_attrs %{content: "some content"}
  @update_attrs %{content: "some updated content"}
  @invalid_attrs %{content: nil}

  defp create_page(_) do
    user = user_fixture()
    page = page_fixture()
    %{user: user, page: page}
  end

  describe "Index" do
    setup [:register_and_log_in_user, :create_page]

    test "lists all pages", %{conn: conn, page: page} do
      {:ok, _index_live, html} = live(conn, ~p"/pages")

      assert html =~ "Listing Pages"
      assert html =~ page.content
    end

    test "saves new page", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/pages")

      assert index_live |> element("a", "New Page") |> render_click() =~
               "New Page"

      assert_patch(index_live, ~p"/pages/new")

      assert index_live
             |> form("#page-form", page: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#page-form", page: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/pages")

      html = render(index_live)
      assert html =~ "Page created successfully"
      assert html =~ "some content"
    end

    test "updates page in listing", %{conn: conn, page: page} do
      {:ok, index_live, _html} = live(conn, ~p"/pages")

      assert index_live |> element("#pages-#{page.slug} a", "Edit") |> render_click() =~
               "Edit Page"

      assert_patch(index_live, ~p"/pages/#{page}/edit")

      assert index_live
             |> form("#page-form", page: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#page-form", page: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/pages")

      html = render(index_live)
      assert html =~ "Page updated successfully"
      assert html =~ "some updated content"
    end

    test "deletes page in listing", %{conn: conn, page: page} do
      {:ok, index_live, _html} = live(conn, ~p"/pages")

      assert index_live |> element("#pages-#{page.slug} a", "Delete") |> render_click()
      refute has_element?(index_live, "#pages-#{page.slug}")
    end
  end

  describe "Show" do
    setup [:register_and_log_in_user, :create_page]

    test "displays page", %{conn: conn, page: page} do
      {:ok, _show_live, html} = live(conn, ~p"/pages/#{page}")

      assert html =~ "Show Page"
      assert html =~ page.content
    end

    test "updates page within modal", %{conn: conn, page: page} do
      {:ok, show_live, _html} = live(conn, ~p"/pages/#{page}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Page"

      assert_patch(show_live, ~p"/pages/#{page}/show/edit")

      assert show_live
             |> form("#page-form", page: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#page-form", page: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/pages/#{page}")

      html = render(show_live)
      assert html =~ "Page updated successfully"
      assert html =~ "some updated content"
    end
  end
end
