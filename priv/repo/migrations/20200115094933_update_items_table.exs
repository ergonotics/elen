defmodule Elen.Repo.Migrations.UpdateItemsTable do
  use Ecto.Migration

  def change do
    alter table(:items) do
      add :status, :integer
      add :message, :string
      add :latitude, :float
      add :longitude, :float
      add :type, :integer
      add :photo, :string
      add :uuid, :string
    end
  end
end
