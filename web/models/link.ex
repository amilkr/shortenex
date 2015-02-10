defmodule Shortenex.Link do
  use Ecto.Model

  schema "links" do
    field :code, :string
    field :url, :string
    field :clicks, :integer
    field :created_at, :datetime, default: Ecto.DateTime.local
    field :updated_at, :datetime, default: Ecto.DateTime.local
  end

  def find_or_create(url: url) do
    link = Shortenex.LinkQuery.find_by(:url, url) |> List.first
    unless link, do: link = create(url: url)
    link
  end

  defp create(url: url) do
    link = %Shortenex.Link{code: new_code, url: url}
    Shortenex.Repo.insert(link)
  end

  defp new_code(retries \\ 5)

  defp new_code(0) do
    raise "Shortenex.Link.new_code: too much retries"
  end

  defp new_code(retries) do
    chars =
      "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
      |> String.split("", trim: true)

    Random.seed(:os.timestamp)
    code = Enum.map_join 1..5, fn(_) -> Random.sample(chars) end

    case Shortenex.LinkQuery.find_by(:code, code) do
      [] -> code
      _ -> new_code(retries - 1)
    end
  end

end