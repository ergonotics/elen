use Mix.Config

# Configure your database
config :elen, Elen.Repo,
  username: "francois",
  password: "",
  database: "elen_dev",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
