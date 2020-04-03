defmodule ElenWeb.ConversationController do
  use ElenWeb, :controller

  alias Elen.Chat

  require IEx

  plug ElenWeb.AssignUser

  def create(conn, %{"conversation" => params}) do
    # case Chat.create_conversation(%{params})
  end
end
