defmodule AppWeb.Components.UI.ModalTest do
  use ExUnit.Case, async: true
  import Phoenix.Component

  alias AppWeb.Components.UI.Modal

  test "renders modal with default size and dynamic backdrop" do
    assigns = Map.new([heading: "Test Modal", backdrop: "dynamic", small: false])

    html = Modal.modal(assigns)

    # Extract static content from the rendered LiveView
    static_html = hd(html.static)

    # Inspect html.dynamic to check its structure
    IO.inspect(html.dynamic, label: "Dynamic HTML")

    # If html.dynamic is a function, try executing it to get the rendered content
    dynamic_html =
      case html.dynamic do
        func when is_function(func) -> to_string(func.())
        _ -> ""
      end

    # Check if the heading is rendered correctly in static_html or dynamic_html
    assert String.contains?(static_html, "<h3 class=\"text-xl font-semibold text-gray-900 dark:text-white\">Test Modal</h3>") or
           String.contains?(dynamic_html, "<h3 class=\"text-xl font-semibold text-gray-900 dark:text-white\">Test Modal</h3>")

    # Check if the modal has the default max width for a large modal
    assert String.contains?(static_html, "max-w-2xl")

    # Check if the backdrop is dynamic (should include 'phx-click')
    assert String.contains?(static_html, "phx-click={close_modal()}")
  end

  test "renders modal with small size" do
    assigns = Map.new([heading: "Test Modal", backdrop: "dynamic", small: true])

    html = Modal.modal(assigns)

    # Extract static content from the rendered LiveView
    static_html = hd(html.static)

    # Inspect html.dynamic to check its structure
    IO.inspect(html.dynamic, label: "Dynamic HTML")

    # If html.dynamic is a function, try executing it to get the rendered content
    dynamic_html =
      case html.dynamic do
        func when is_function(func) -> to_string(func.())
        _ -> ""
      end

    # Check if the heading is rendered correctly in static_html or dynamic_html
    assert String.contains?(static_html, "<h3 class=\"text-xl font-semibold text-gray-900 dark:text-white\">Test Modal</h3>") or
           String.contains?(dynamic_html, "<h3 class=\"text-xl font-semibold text-gray-900 dark:text-white\">Test Modal</h3>")

    # Check if the modal has the small size class
    assert String.contains?(static_html, "max-w-md")
  end

  test "renders modal with static backdrop" do
    assigns = Map.new([heading: "Test Modal", backdrop: "static", small: false])

    html = Modal.modal(assigns)

    # Extract static content from the rendered LiveView
    static_html = hd(html.static)

    # Inspect html.dynamic to check its structure
    IO.inspect(html.dynamic, label: "Dynamic HTML")

    # Check if the backdrop is static (should not have 'phx-click')
    refute String.contains?(static_html, "phx-click={close_modal()}")
  end
end
