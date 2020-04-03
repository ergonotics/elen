defmodule ElenWeb.Router do
  use ElenWeb, :router
  use Pow.Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated, error_handler: Pow.Phoenix.PlugErrorHandler
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug ElenWeb.ApiAuthPlug, otp_app: :elen
  end

  pipeline :api_protected do
    plug Pow.Plug.RequireAuthenticated, error_handler: ElenWeb.ApiAuthErrorHandler
  end

  scope "/" do
    pipe_through :browser
    pow_routes()
  end

  scope "/", ElenWeb do
    pipe_through :browser

    get "/", PageController, :index
    # resources "/photos", PhotoController
    get "/found/:code", FoundController, :show
  end

  scope "/", ElenWeb do
    pipe_through [:browser, :protected]

    resources "/conversations", ConversationController
    resources "/items", ItemController
    resources "/users", UserController, except: [:create]
    live "/conversations/:conversation_id/users/:user_id", ConversationLive, as: :conversation
  end

  scope "/api", ElenWeb do
    pipe_through :api
    resources "/registration", Api.RegistrationController, singleton: true, only: [:create]
    resources "/session", Api.SessionController, singleton: true, only: [:create, :delete]
    post "/session/renew", Api.SessionController, :renew
    resources "/users", Api.UserController, except: [:create] # move to protected

    get "/found/:code", Api.FoundController, :show
  end

  scope "/api", ElenWeb do
    pipe_through [:api, :api_protected]
    resources "/items", Api.ItemController
  end

end
