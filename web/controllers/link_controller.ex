defmodule Shortenex.LinkController do
  use Phoenix.Controller

  plug :action

  def index(conn, _params) do
    render conn, :index
  end

  def create(conn, %{"url" => url}) do
    link = Shortenex.Link.find_or_create(url: url)

    conn
    |> put_flash(:notice, "Here you have the shortened url: http://localhost:4000/s/#{link.code}")
    |> redirect to: "/"
  end
end
