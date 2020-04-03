defmodule ElenWeb.Api.ItemView do
  use ElenWeb, :view

  def render("index.json", %{items: items}) do
    %{data: render_many(items, ElenWeb.Api.ItemView, "item.json")}
  end

  def render("show.json", %{item: item}) do
    %{data: render_one(item, ElenWeb.Api.ItemView, "item.json")}
  end

  def render("item.json", %{item: item}) do
    photo_url = Elen.Photo.url({item.photo, item}, :original)
    thumb_url = Elen.Photo.url({item.photo, item}, :thumb)

    %{id: item.id, user_id: item.user_id, name: item.name, code: item.code, status: item.status, type: item.type, message: item.message, latitude: item.latitude, longitude: item.longitude, photo_url: photo_url, thumb_url: thumb_url}
  end

end
