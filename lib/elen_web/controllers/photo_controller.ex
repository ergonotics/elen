defmodule ElenWeb.PhotoController do
  use ElenWeb, :controller

  alias Elen.Content
  alias Elen.Content.Photo

  def index(conn, _params) do
    photos = Content.list_photos()
    render(conn, "index.html", photos: photos)
  end

  def new(conn, _params) do
    changeset = Content.change_photo(%Photo{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"photo" => photo_params}) do
    case Content.create_photo(photo_params) do
      {:ok, photo} ->
        conn
        |> put_flash(:info, "Photo created successfully.")
        |> redirect(to: Routes.photo_path(conn, :show, photo))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def create(conn, params) do
    msg = if (Map.get(params, "photo") == nil) do
      "No photo selected"
    else
      "Please try again, something went wrong"
    end

    conn
    |> put_flash(:info, msg)
    |> redirect(to: Routes.photo_path(conn, :new))
  end

  def show(conn, %{"id" => id}) do
    photo = Content.get_photo!(id)
    render(conn, "show.html", photo: photo)
  end

  def edit(conn, %{"id" => id}) do
    photo = Content.get_photo!(id)
    changeset = Content.change_photo(photo)
    render(conn, "edit.html", photo: photo, changeset: changeset)
  end

  def update(conn, %{"id" => id, "photo" => photo_params}) do
    photo = Content.get_photo!(id)

    case Content.update_photo(photo, photo_params) do
      {:ok, photo} ->
        conn
        |> put_flash(:info, "Photo updated successfully.")
        |> redirect(to: Routes.photo_path(conn, :show, photo))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", photo: photo, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    photo = Content.get_photo!(id)
    {:ok, _photo} = Content.delete_photo(photo)

    conn
    |> put_flash(:info, "Photo deleted successfully.")
    |> redirect(to: Routes.photo_path(conn, :index))
  end
end
