User.destroy_all
Pet.destroy_all

puts "Seeding database..."
puts "Creating master user..."
User.new(
  email: 'sanalmiron@hotmail.com',
  password: '123456',
  role: 'superadmin'
).save(validate: false)

puts "Creating additional users and pets for development..."
if Rails.env.development?
  10.times do
    FactoryBot.create(:pet)
    FactoryBot.create(:user)
  end
end
