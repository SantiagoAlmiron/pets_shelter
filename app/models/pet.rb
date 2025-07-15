class Pet < ApplicationRecord
  validates :name, presence: true

  has_one_attached :photo

  before_destroy :purge_photo

  private

  def purge_photo
    photo.purge if photo.attached?
  end
end
