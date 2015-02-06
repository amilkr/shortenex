defmodule Shortenex.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ~w(html)
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  scope "/", Shortenex do
    pipe_through :browser # Use the default browser stack

    get "/", LinkController, :index
    get "/s/:code", LinkController, :show
    post "/s", LinkController, :create
  end
end
