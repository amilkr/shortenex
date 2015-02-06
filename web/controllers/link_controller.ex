defmodule Shortenex.LinkController do
  use Phoenix.Controller

  plug :action

  def index(conn, _params) do
    render conn, :index
  end

  def create(conn, %{"url" => url}) do
    link = Shortenex.LinkQuery.find_by(:url, url) |> List.first
    unless link do
      code = "H3lr4"
      link = %Shortenex.Link{code: code, url: url}
      link = Shortenex.Repo.insert(link)
    end
    conn
    |> put_flash(:notice, "Here you have the shortened url: http://localhost:4000/s/#{code}")
    |> redirect to: "/"
  end
end
