defmodule ElenWeb.Api.UserView do
  use ElenWeb, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, ElenWeb.Api.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, ElenWeb.Api.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id, nickname: user.nickname, firstname: user.firstname, lastname: user.lastname, country: user.country, city: user.city, zip: user.zip, street: user.street, mobile: user.mobile}
  end

end
