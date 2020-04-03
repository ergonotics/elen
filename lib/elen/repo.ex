defmodule Elen.Repo do
  use Ecto.Repo,
    otp_app: :elen,
    adapter: Ecto.Adapters.Postgres
end
