defmodule AppWeb.Layouts do
  @moduledoc """
  This module holds different layouts used by your application.

  See the `layouts` directory for all templates available.
  The "root" layout is a skeleton rendered as part of the
  application router. The "app" layout is set as the default
  layout on both `use AppWeb, :controller` and
  `use AppWeb, :live_view`.
  """
  use AppWeb, :html

  use Phoenix.VerifiedRoutes,
        endpoint: AppWeb.Endpoint,
        router: AppWeb.Router,
        statics: AppWeb.static_paths()

  embed_templates "layouts/*"
end
