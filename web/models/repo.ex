defmodule Shortenex.Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def conf do
    parse_url "ecto://dev:dev@localhost:5432/shortenex"
  end

  def priv do
    app_dir(:shortenex, "priv/repo")
  end
end