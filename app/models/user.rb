# app/models/user.rb
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  enum role: { user: 'user', admin: 'admin', superadmin: 'superadmin' }

  validates :email, email_domain: true
  validates :password, password_complexity: true
end
