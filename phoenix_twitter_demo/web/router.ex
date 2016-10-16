# /web/router.ex

defmodule TwitterDemo.Router do
  use TwitterDemo.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TwitterDemo do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/timeline", PageController, :timeline
  end

  # Other scopes may use custom stacks.
  # scope "/api", TwitterDemo do
  #   pipe_through :api
  # end
end
