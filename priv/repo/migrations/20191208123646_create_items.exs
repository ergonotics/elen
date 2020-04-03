defmodule Elen.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :code, :string
      add :user_id, references(:auth_users, on_delete: :delete_all)

      timestamps()
    end
    create unique_index(:items, [:code])
  end
end
