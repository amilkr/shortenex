use Mix.Config

# ## SSL Support
#
# To get SSL working, you will need to set:
#
#     https: [port: 443,
#             keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#             certfile: System.get_env("SOME_APP_SSL_CERT_PATH")]
#
# Where those two env variables point to a file on
# disk for the key and cert.

config :shortenex, Shortenex.Endpoint,
  url: [host: "example.com"],
  http: [port: System.get_env("PORT")],
  secret_key_base: "QnE0PuKJt5NNipsSD/urzmFM7j1MWXc+7xs3XN52xGDCIXtC/9lARa562Sc1/HSQ"

# Do not pring debug messages in production
config :logger, level: :info

# ## Using releases
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start the server for all endpoints:
#
#     config :phoenix, :serve_endpoints, true
#
# Alternatively, you can configure exactly which server to
# start per endpoint:
#
#     config :shortenex, Shortenex.Endpoint, server: true
#
