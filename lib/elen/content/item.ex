defmodule Elen.Content.Item do
  use Ecto.Schema
  use Arc.Ecto.Schema
  import Ecto.Changeset

  @code_length 8

  schema "items" do
    field :name, :string
    field :code, :string
    field :status, :integer
    field :message, :string
    field :latitude, :float
    field :longitude, :float
    field :type, :integer

    field :photo, Elen.Photo.Type
    field :uuid, :string

    belongs_to :user, Elen.Auth.User
    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> Map.update(:code, Elen.Randomizer.randomize(@code_length), fn val -> val || Elen.Randomizer.randomize(@code_length) end)
    |> Map.update(:uuid, Ecto.UUID.generate, fn val -> val || Ecto.UUID.generate end)
    |> cast(attrs, [:name, :status, :type, :message, :latitude, :longitude])
    |> cast_attachments(attrs, [:photo])
    |> validate_required([:name])
  end

  def qrcode(item) do
    "https//lnf.liger.be/found/#{item.code}"
    |> EQRCode.encode()
    |> EQRCode.png()
    |> Base.encode64
  end

end
