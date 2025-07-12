User.destroy_all
Pet.destroy_all

User.new(
  email: 'sanalmiron@hotmail.com',
  password: '123456',
  role: 'superadmin'
).save(validate: false)

if Rails.env.development?
  10.times do
    FactoryBot.create(:pet)
    FactoryBot.create(:user)
  end
end
