defmodule ElenWeb.PageController do
  use ElenWeb, :controller

  plug ElenWeb.AssignUser, preload: :conversations

  def index(conn, opts \\ []) do
    render(conn, "index.html")
  end
end
