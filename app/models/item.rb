class Item < ApplicationRecord
  has_one_attached :photo
  validates :name, presence: true
  validate :acceptable_photo

  def acceptable_photo
    return unless photo.attached?

    unless photo.byte_size <= 3.megabytes
      errors.add(:photo, "is too big")
    end

    acceptable_types = ["image/jpg", "image/jpeg", "image/png"]
    unless acceptable_types.include?(photo.content_type)
      errors.add(:photo, "must be a JPEG or a PNG")
    end
  end
end
