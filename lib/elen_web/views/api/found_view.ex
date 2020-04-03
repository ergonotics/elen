defmodule ElenWeb.Api.FoundView do
  use ElenWeb, :view

  def render("show.json", %{item: item}) do
    %{data: render_one(item, ElenWeb.Api.ItemView, "item.json")}
  end

end
