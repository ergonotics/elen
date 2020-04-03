defmodule Elen.Repo.Migrations.UpdateUsersTable do
  use Ecto.Migration

  def change do
    alter table(:auth_users) do
      add :firstname, :string
      add :lastname, :string
      add :country, :string
      add :city, :string
      add :zip, :string
      add :street, :string
      add :mobile, :string
    end
  end
end
