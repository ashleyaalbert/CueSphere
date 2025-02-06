defmodule AppWeb.Components.UI.TagTest do
  use AppWeb.ComponentCase

  import AppWeb.Components.UI.Tag

  test "default tag" do
    assigns = %{}

    html =
      rendered_to_string(
        ~H"""
        <.tag>Tag Default</.tag>
        """
      )

    assert html =~ "text-blue-800"
    assert html =~ "bg-blue-100"
    assert html =~ "py-1 px-3"
    assert html =~ "Tag Default"
  end

  test "tag with custom class" do
    assigns = %{}

    html =
      rendered_to_string(
        ~H"""
        <.tag class="custom-class">Custom Tag</.tag>
        """
      )

    assert html =~ "custom-class"
    assert html =~ "Custom Tag"
  end

  test "tag with different colors" do
    for color <- ["red", "green", "yellow", "purple", "indigo", "pink"] do
      assigns = %{color: color}

      html =
        rendered_to_string(
          ~H"""
          <.tag color={@color}>Color Test</.tag>
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
        <.tag color={@color}>Color Test</.tag>
        """
      )

    assert html =~ "Color Test"
    assert html =~ "bg-gray-100"
    assert html =~ "text-gray-800"
  end

  test "large tag" do
    assigns = %{}

    html =
      rendered_to_string(
        ~H"""
        <.tag large={true}>Large Tag</.tag>
        """
      )

    assert html =~ "text-sm"
    assert html =~ "Large Tag"
  end

  test "small tag" do
    assigns = %{}

    html =
      rendered_to_string(
        ~H"""
        <.tag large={false}>Small Tag</.tag>
        """
      )

    assert html =~ "text-xs"
    assert html =~ "Small Tag"
  end
end
