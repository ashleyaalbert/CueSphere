defmodule AppWeb.Components.UI.PillTest do
  use AppWeb.ComponentCase

  import AppWeb.Components.UI.Pill

  test "default pill" do
    assigns = %{}

    html =
      rendered_to_string(
        ~H"""
        <.pill>Pill Default</.pill>
        """
      )

    assert html =~ "text-blue-800"
    assert html =~ "bg-blue-100"
    assert html =~ "py-2.5 px-5"
    assert html =~ "Pill Default"
  end

  test "pill with custom class" do
    assigns = %{}

    html =
      rendered_to_string(
        ~H"""
        <.pill class="custom-class">Custom Pill</.pill>
        """
      )

    assert html =~ "custom-class"
    assert html =~ "Custom Pill"
  end

  test "pill with different colors" do
    for color <- ["red", "green", "yellow", "purple", "indigo", "pink"] do
      assigns = %{color: color}

      html =
        rendered_to_string(
          ~H"""
          <.pill color={@color}>Color Test</.pill>
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
        <.pill color={@color}>Color Test</.pill>
        """
      )

    assert html =~ "Color Test"
    assert html =~ "bg-gray-100"
    assert html =~ "text-gray-800"
  end

  test "large pill" do
    assigns = %{}

    html =
      rendered_to_string(
        ~H"""
        <.pill large={true}>Large Pill</.pill>
        """
      )

    assert html =~ "text-sm"
    assert html =~ "Large Pill"
  end

  test "small pill" do
    assigns = %{}

    html =
      rendered_to_string(
        ~H"""
        <.pill large={false}>Small Pill</.pill>
        """
      )

    assert html =~ "text-xs"
    assert html =~ "Small Pill"
  end
end
