defmodule Shortenex.LinkController do
  use Phoenix.Controller

  plug :action

  def index(conn, _params) do
    render conn, :index
  end

  def create(conn, %{"url" => url}) do
    link = Shortenex.Link.find_or_create(url: url)
    shortened_url = "http://localhost:4000/s/#{link.code}"
    conn
    |> assign(:shortened_url, shortened_url)
    |> render :index
  end

  def show(conn, %{"code" => code}) do
    link = Shortenex.LinkQuery.find_by(:code, code) |> List.first
    if link do
      redirect(conn, external: link.url)
    else
      conn
      |> put_flash(:error, "it seems your shortened url is not valid")
      |> render :index
    end
  end
  
end
