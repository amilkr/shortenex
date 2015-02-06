defmodule Shortenex.Link do
  use Ecto.Model

  schema "links" do
    field :code, :string
    field :url, :string
    field :clicks, :integer
    field :created_at, :datetime, default: Ecto.DateTime.local
    field :updated_at, :datetime, default: Ecto.DateTime.local
  end
end