defmodule ElenWeb.FoundController do
  use ElenWeb, :controller

  alias Elen.Content
  alias Elen.Content.Item

  def show(conn, %{"code" => code}) do
    case Content.get_item_by_code(code) do
      nil  -> send_resp(conn, 404, "not found")
      item -> render(conn, "show.html", item: item)
    end
  end

end
