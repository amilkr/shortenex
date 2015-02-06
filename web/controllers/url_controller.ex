defmodule Shortenex.UrlController do
  use Phoenix.Controller

  plug :action

  def index(conn, _params) do
    render conn, :index
  end

  def create(conn, %{"url" => url}) do
    conn
    |> put_flash(:notice, "Here you have the shortened url: #{url}")
    |> redirect to: "/"
  end
end
