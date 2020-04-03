defmodule Elen.Photo do
  use Arc.Definition
  use Arc.Ecto.Definition

  @extension_whitelist ~w(.jpeg .jpg .gif .png)

  @versions [:original, :thumb]

  # Override the bucket on a per definition basis:
  # def bucket do
  #   :custom_bucket_name
  # end

  # Whitelist file extensions:
  def validate({file, _}) do
    file_extension = file.file_name |> Path.extname() |> String.downcase()
    Enum.member?(@extension_whitelist, file_extension)
  end

  # Define a thumbnail transformation:
  def transform(:thumb, _) do
    {:convert, "-strip -thumbnail 256x256^ -gravity center -extent 256x256 -format png", :png}
  end

  # Override the persisted filenames:
  def filename(version, {file, scope}) do
    "#{scope.uuid}_#{version}"
  end

  # Override the storage directory:
  def storage_dir(version, {file, scope}) do
    "uploads/photos/"
  end

  # Provide a default URL if there hasn't been a file uploaded
  # def default_url(version, scope) do
  #   "/images/avatars/default_#{version}.png"
  # end
end
