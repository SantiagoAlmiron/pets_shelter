# app/models/user.rb
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  enum role: {
    visitor: 'visitor',
    sponsorship: 'sponsorship',
    volunteer: 'volunteer',
    admin: 'admin',
    superadmin: 'superadmin'
  }

  validates :email, email_domain: true
  validates :password, password_complexity: true

  def block!
    update(blocked_at: Time.current)
  end

  def unblock!
    update(blocked_at: nil)
  end

  def blocked?
    blocked_at.present?
  end

  def can_access_admin_area?
    superadmin? || admin?
  end
end
