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

    get "/", UrlController, :index
    get "/s/:id", UrlController, :show
    post "/s", UrlController, :create
  end
end
