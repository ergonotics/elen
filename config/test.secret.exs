use Mix.Config

# Configure your database
config :elen, Elen.Repo,
  username: "francois",
  password: "",
  database: "elen_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
