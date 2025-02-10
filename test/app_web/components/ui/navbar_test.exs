defmodule AppWeb.Components.UI.NavbarTest do
  use ExUnit.Case, async: true
  import Phoenix.Component

  alias AppWeb.Components.UI.Navbar

  describe "Navbar component" do
    test "renders navbar with correct links" do
      # Directly call the Navbar component and get the HTML string
      html = Navbar.navbar(%{})

      # Assert that the HTML contains the expected links
      assert html =~ "Home"
      assert html =~ "Planets"
      assert html =~ "Courses"
    end

    test "menu button toggles visibility when clicked" do
      # Initially render the Navbar component (without toggle state)
      html = Navbar.navbar(%{})

      # Assert that the menu is not visible (hidden class should be present)
      refute html =~ "w-full"

      # Render the Navbar component with the toggle state (button clicked)
      html = Navbar.navbar(%{toggle: true})

      # Assert that the menu is visible after the toggle
      assert html =~ "w-full"
    end

    test "menu button toggles aria-expanded attribute" do
      # Initially render the Navbar component (aria-expanded should be false)
      html = Navbar.navbar(%{})

      # Assert aria-expanded is false initially
      refute html =~ "aria-expanded=\"true\""

      # Render the Navbar component with the toggle state (button clicked)
      html = Navbar.navbar(%{toggle: true})

      # Assert aria-expanded is true after the button is clicked
      assert html =~ "aria-expanded=\"true\""
    end
  end
end
