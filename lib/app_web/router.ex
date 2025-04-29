defmodule AppWeb.Router do
  use AppWeb, :router

  import AppWeb.UserAuth
  import AppWeb.LocaleController, only: [put_locale: 2]

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :put_locale
    plug :fetch_live_flash
    plug :put_root_layout, html: {AppWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
    plug AppWeb.Plugs.CustomPlug
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AppWeb do
    pipe_through :browser

    get "/", PageController, :home
    get "/courses", PageController, :courses
    get "/courses/:slug", PageController, :courses
    get "/planets", PlanetController, :planets
    get "/planets/random", PlanetController, :random
    get "/planets/:id", PlanetController, :index
    resources "/messages", MessageController, only: [:create, :new, :show]
    put "/locale/:locale", LocaleController, :update
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:app, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: AppWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end

  ## Authentication routes

  scope "/", AppWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    live_session :redirect_if_user_is_authenticated,
      on_mount: [
        {AppWeb.UserAuth, :redirect_if_user_is_authenticated},
        {AppWeb.UserAuth, :add_message_changeset},
        {AppWeb.UserAuth, :put_locale}
      ] do
      live "/users/register", UserRegistrationLive, :new
      live "/users/log_in", UserLoginLive, :new
      live "/users/reset_password", UserForgotPasswordLive, :new
      live "/users/reset_password/:token", UserResetPasswordLive, :edit
    end

    post "/users/log_in", UserSessionController, :create
  end

  scope "/", AppWeb do
    pipe_through [:browser, :require_authenticated_user]

    live_session :require_authenticated_user,
      on_mount: [
        {AppWeb.UserAuth, :ensure_authenticated},
        {AppWeb.UserAuth, :add_message_changeset},
        {AppWeb.UserAuth, :put_locale}
      ] do
      live "/users/settings", UserSettingsLive, :edit
      live "/users/settings/confirm_email/:token", UserSettingsLive, :confirm_email
      resources "/messages", MessageController, only: [:delete, :index]

      live "/topics", TopicLive.Index, :index
      live "/topics/new", TopicLive.Index, :new
      live "/topics/:slug/edit", TopicLive.Index, :edit
      live "/topics/:slug/show/edit", TopicLive.Show, :edit
      live "/topics/:slug", TopicLive.Show, :show

      live "/topics/:slug/pages", PageLive.Index, :index
      live "/topics/:slug/pages/new", PageLive.Index, :new
      live "/topics/:slug/pages/:id", PageLive.Show, :show
      live "/topics/:slug/pages/:id/edit", PageLive.Show, :edit
    end
  end

  scope "/", AppWeb do
    pipe_through [:browser]

    delete "/users/log_out", UserSessionController, :delete

    live_session :current_user,
      on_mount: [
        {AppWeb.UserAuth, :mount_user_id},
        {AppWeb.UserAuth, :add_message_changeset},
        {AppWeb.UserAuth, :put_locale}
      ] do
      live("/live/thermostat", ThermostatLive)
      live("/facemash", FacemashLive)
      live("/live/planets", PlanetsLive)
      live "/users/confirm/:token", UserConfirmationLive, :edit
      live "/users/confirm", UserConfirmationInstructionsLive, :new
      live "/chat", ChatLive, :chat
      live "/chat/join", ChatLive, :join
      live "/accessibility", AccessibilityLive
      live "/animations", AnimationsLive
      live "/gallery", GalleryLive
      live "/charts", ChartsLive
      live "/minesweeper", MinesweeperLive, :new
      live "/taskmanager", TaskManagerLive

      live "/about", AboutLive
      live "/facts", FactsLive
      live "/fargo-rate", FargoRateLive
      live "/purchase", PurchaseLive
      live "/tutorials", TutorialsLive
      live "/drills", DrillsLive
      live "/books", BooksLive
      live "/movies", MoviesLive
      live "/rules", RulesLive
      live "/games", GamesLive
      live "/leagues", LeaguesLive
      live "/tournaments", TournamentsLive

      live("/items", ItemLive.Index, :index)
      live("/items/new", ItemLive.Index, :new)
      live("/items/:id/edit", ItemLive.Index, :edit)

      live("/items/:id", ItemLive.Show, :show)
      live("/items/:id/show/edit", ItemLive.Show, :edit)
    end
  end
end
