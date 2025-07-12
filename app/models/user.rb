# app/models/user.rb
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  enum role: { user: 'user', admin: 'admin', superadmin: 'superadmin' }
end
