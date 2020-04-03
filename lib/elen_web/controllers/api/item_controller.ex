defmodule ElenWeb.Api.ItemController do
  use ElenWeb, :controller

  alias Elen.Content
  alias Elen.Content.Item

  def index(conn, _params) do
    if conn.assigns.current_user == nil do
      send_resp(conn, 403, "not allowed")
    end
    items = Content.list_items(conn.assigns.current_user)
    render(conn, "index.json", items: items)
  end

  def create(conn, %{"item" => item_params}) do
    with {:ok, %Item{} = item} <- Content.create_item(item_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.item_path(conn, :show, item))
      |> render("show.json", item: item)
    end
  end

  def show(conn, %{"id" => id}) do
    item = Content.get_item!(id)
    render(conn, "show.json", item: item)
  end

  def update(conn, %{"id" => id, "item" => item_params}) do
    item = Content.get_item!(id)

    with {:ok, %Item{} = item} <- Content.update_item(item, item_params) do
      render(conn, "show.json", item: item)
    end
  end

  def delete(conn, %{"id" => id}) do
    item = Content.get_item!(id)

    with {:ok, %Item{}} <- Content.delete_item(item) do
      send_resp(conn, :no_content, "")
    end
  end

end
