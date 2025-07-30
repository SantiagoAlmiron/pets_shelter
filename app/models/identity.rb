class Identity < ApplicationRecord
  belongs_to :user

  before_validation :normalize_strings

  validates :name, :surname, :birth_date, :phone, :dni, :street_name,
            :street_number, :city, :postal_code, presence: true

  validates :dni, uniqueness: true
  validates :gender, inclusion: { in: %w[male female other], allow_blank: true }
  validates :accepted_terms, acceptance: { message: "debe aceptar los términos y condiciones" }

  private

  def normalize_strings
    attributes.each do |attr, value|
      if value.is_a?(String)
        self[attr] = value.strip.downcase unless value.nil?
      end
    end
  end
end
