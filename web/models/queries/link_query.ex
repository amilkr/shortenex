defmodule Shortenex.LinkQuery do
  import Ecto.Query

  def find_by(field, value) do
    query = from links in Shortenex.Link,
            where: "links.#{field}" == "#{value}",
            limit: 1,
            select: links
    Shortenex.Repo.all query
  end
end
