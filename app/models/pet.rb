class Pet < ApplicationRecord
  validates :name, presence: true

  has_one_attached :photo

  has_many :adoptions, dependent: :destroy

  has_one :adoption, -> { where(type: 'Adoption') }, class_name: 'Adoption'
  has_one :adopter, through: :adoption, source: :user

  has_many :sponsorships, -> { where(type: 'Sponsorship') }, class_name: 'Adoption', dependent: :destroy
  has_many :sponsors, through: :sponsorships, source: :user

  before_destroy :purge_photo

  private

  def purge_photo
    photo.purge if photo.attached?
  end
end
