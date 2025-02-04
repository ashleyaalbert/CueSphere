defmodule AppWeb.Components.UI.BadgeTest do
  use AppWeb.ComponentCase

  import AppWeb.Components.UI.Badge

  test "default badge" do
    assigns = %{}

    html =
      rendered_to_string(
        ~H"""
        <.badge>Default</.badge>
        """
      )

    assert html =~ "text-blue-800"
    assert html =~ "bg-blue-100"
    assert html =~ "px-2.5 py-0.5"
    assert html =~ "Default"
  end

  test "badge with custom class" do
    assigns = %{}

    html =
      rendered_to_string(
        ~H"""
        <.badge class="custom-class">Custom</.badge>
        """
      )

    assert html =~ "custom-class"
    assert html =~ "Custom"
  end

  test "badge with different colors" do
    for color <- ["red", "green", "yellow", "purple", "indigo", "pink"] do
      assigns = %{color: color}

      html =
        rendered_to_string(
          ~H"""
          <.badge color={@color}>Color Test</.badge>
          """
        )

      assert html =~ "Color Test"
      assert html =~ "bg-#{color}-100"
      assert html =~ "text-#{color}-800"
    end

    assigns = %{color: "dark"}
    html =
      rendered_to_string(
        ~H"""
        <.badge color={@color}>Color Test</.badge>
        """
      )

    assert html =~ "Color Test"
    assert html =~ "bg-gray-100"
    assert html =~ "text-gray-800"  
  end

  test "large badge" do
    assigns = %{}

    html =
      rendered_to_string(
        ~H"""
        <.badge large={true}>Large</.badge>
        """
      )

    assert html =~ "text-sm"
    assert html =~ "Large"
  end

  test "small badge" do
    assigns = %{}

    html =
      rendered_to_string(
        ~H"""
        <.badge large={false}>Small</.badge>
        """
      )

    assert html =~ "text-xs"
    assert html =~ "Small"
  end
end
