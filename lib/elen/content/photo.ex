defmodule Elen.Content.Photo do
  use Ecto.Schema
  use Arc.Ecto.Schema
  import Ecto.Changeset

  schema "photos" do
    field :photo, Elen.Photo.Type
    field :uuid, :string
    belongs_to :item, Elen.Content.Item

    timestamps()
  end

  @doc false
  def changeset(photo, attrs) do
    photo
    |> Map.update(:uuid, Ecto.UUID.generate, fn val -> val || Ecto.UUID.generate end)
    |> cast_attachments(attrs, [:photo])
    |> validate_required([:photo])
  end
end
