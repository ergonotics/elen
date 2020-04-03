defmodule Elen.Repo.Migrations.CreatePhotos do
  use Ecto.Migration

  def change do
    create table(:photos) do
      add :photo, :string
      add :uuid, :string
      add :item_id, references(:items, on_delete: :delete_all)

      timestamps()
    end
  end
end
