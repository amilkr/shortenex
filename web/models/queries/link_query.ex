defmodule Shortenex.LinkQuery do
  import Ecto.Query

  def find_by(field, value) do
    query = from link in Shortenex.Link,
            where: field(link, ^field) == ^value,
            limit: 1,
            select: link
    Shortenex.Repo.all query
  end
end
