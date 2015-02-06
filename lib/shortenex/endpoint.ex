defmodule Shortenex.Endpoint do
  use Phoenix.Endpoint, otp_app: :shortenex

  plug Plug.Static,
    at: "/", from: :shortenex

  plug Plug.Logger

  # Code reloading will only work if the :code_reloader key of
  # the :phoenix application is set to true in your config file.
  plug Phoenix.CodeReloader

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_shortenex_key",
    signing_salt: "WSXA+KWW",
    encryption_salt: "LhXN6agd"

  plug :router, Shortenex.Router
end
