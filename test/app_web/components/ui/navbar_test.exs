# defmodule AppWeb.Components.UI.NavbarTest do
#   use AppWeb.ConnCase, async: true

#   import Phoenix.LiveViewTest
#   alias AppWeb.Components.UI.Navbar

#   test "renders navbar correctly" do
#     assigns = %{}

#     html = render_component(&Navbar.navbar/1, assigns)

#     assert html =~ "<nav"
#     assert html =~ "General"
#     assert html =~ "Learn"
#     assert html =~ "Play"
#   end

#   test "menu button has correct attributes" do
#     assigns = %{}

#     html = render_component(&Navbar.navbar/1, assigns)
#     assert html =~ "id=\"menu-button\""
#     assert html =~ "aria-controls=\"menu\""
#     assert html =~ "aria-expanded=\"false\""
#   end
# end
