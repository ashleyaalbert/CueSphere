defmodule AppWeb.Components.UI.ModalTest do
  use AppWeb.ComponentCase

  import AppWeb.Components.UI.Modal

  test "default modal" do
    assigns = %{}

    html =
      rendered_to_string(
        ~H"""
        <.modal heading="Test Modal Heading" backdrop="dynamic">
          <p>Testing modal content</p>
        </.modal>
        """
      )

    assert html =~ "Test Modal Heading"
    assert html =~ "Testing modal content"
    assert html =~ "id=\"default-modal\""
    assert html =~ "hidden"
    assert html =~ "phx-click="
  end

  test "smaller modal variant" do
    assigns = %{}

    html =
      rendered_to_string(
        ~H"""
        <.modal heading="Small Modal" backdrop="static" small>
          <p>This is a small modal</p>
        </.modal>
        """
      )

    assert html =~ "max-w-md"
    assert html =~ "Small Modal"
    assert html =~ "This is a small modal"
  end

  test "open_modal JS command properly functions" do
    js = open_modal()
    assert %Phoenix.LiveView.JS{} = js

    js_map = Map.from_struct(js)

    assert Enum.any?(js_map.ops, fn
      ["show", %{to: "#default-modal"}] -> true
      _ -> false
    end)
  end

  test "close_modal JS command returns a JS struct with proper attributes" do
    js = close_modal()
    assert %Phoenix.LiveView.JS{} = js

    js_map = Map.from_struct(js)
    
    assert Enum.any?(js_map.ops, fn
      ["hide", %{to: "#default-modal"}] -> true
      _ -> false
    end)
  end
end
