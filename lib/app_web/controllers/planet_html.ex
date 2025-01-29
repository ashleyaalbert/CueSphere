defmodule AppWeb.PlanetHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """
  use AppWeb, :html

  embed_templates "planet_html/*"

end
