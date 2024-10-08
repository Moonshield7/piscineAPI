defmodule Something.Repo.Migrations.CreateClock do
  use Ecto.Migration

  def change do
    create table(:clock) do
      add :time, :naive_datetime
      add :status, :boolean, default: false, null: false
      add :user, references(:users, on_delete: :nothing)
      add :id, :id

      timestamps(type: :utc_datetime)
    end

    create index(:clock, [:user])
  end
end
