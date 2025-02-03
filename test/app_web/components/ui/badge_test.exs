defmodule AppWeb.Components.UI.BadgeTest do
  use AppWeb.ComponentCase

  import AppWeb.Components.UI.Badge

  test "default button" do
    assigns = %{}

    html =
      rendered_to_string(
        ~H"""
        <.badge class="custom-class" id="ID">Click</.badge>
        """
      )

    assert html =~ "id=\"ID"
    assert html =~ "type=\"badge"
    assert html =~ "custom-class"
    assert html =~ "text-white bg-blue-700 hover:bg-blue-800"
    assert html =~ "py-2.5 px-5 me-2 mb-2"
    assert html =~ "Click"
    assert html =~ "</badge>"
  end

  test "default badge with custom classes" do
    assigns = %{}

    html =
      rendered_to_string(
        ~H"""
        <.badge color="default" class="custom-class">Click</.badge>
        """
      )
    assert html =~ "type=\"badge"
    assert html =~ "text-white bg-blue-700 hover:bg-blue-800"
    assert html =~ "Click"
  end

  test "alternative submit badge" do
    assigns = %{}

    html =
      rendered_to_string(
        ~H"""
        <.badge type="submit" color="alternative">Click</.badge>
        """
      )

    assert html =~ "type=\"submit"
    assert html =~ "py-2.5 px-5 me-2 mb-2"
    assert html =~ "text-gray-900 bg-white border border-gray-200"
    assert html =~ "</badge>"
  end
end
