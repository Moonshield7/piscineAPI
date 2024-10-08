defmodule Something.Repo do
  use Ecto.Repo,
    otp_app: :piscineAPI,
    adapter: Ecto.Adapters.Postgres
end
