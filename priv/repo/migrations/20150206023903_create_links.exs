defmodule Shortenex.Repo.Migrations.CreateLinks do
  use Ecto.Migration

  def up do
    "CREATE TABLE links( \
      id serial primary key, \
      code varchar(50), \
      url varchar(255), \
      clicks integer DEFAULT 0, \
      created_at timestamp, \
      updated_at timestamp)"
  end

  def down do
    "DROP TABLE links"
  end
end
