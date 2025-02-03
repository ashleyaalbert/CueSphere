defmodule AppWeb.ComponentCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that use simple function components.
  """
  use ExUnit.CaseTemplate

  using do
    quote do
      import Phoenix.Component
      import Phoenix.LiveViewTest
    end
  end
end
