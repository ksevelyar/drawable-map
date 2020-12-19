defmodule DrawableMap.Repo do
  use Ecto.Repo,
    otp_app: :drawable_map,
    adapter: Ecto.Adapters.Postgres
end
