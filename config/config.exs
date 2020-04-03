# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elen,
  ecto_repos: [Elen.Repo]

# Configures the endpoint
config :elen, ElenWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1m10ShO0FK05tgr9HPV0aA5t41WshopK8XT3rr/wbfwTfB99HqlsP/aDY7343/Mi",
  render_errors: [view: ElenWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Elen.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "w9cORhPKD1TBowdK7sZpM9GkTs0d21Wk"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configure Pow with user schema for authentication
config :elen, :pow,
  user: Elen.Auth.User,
  repo: Elen.Repo,
  web_module: ElenWeb

# Configure Arc for local storage
config :arc,
  storage: Arc.Storage.Local

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
