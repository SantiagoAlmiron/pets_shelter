FactoryBot.define do
  factory :identity do
    name { Faker::Name.first_name }
    surename { Faker::Name.last_name }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) }
    birth_state { Faker::Address.state }
    phone { Faker::PhoneNumber.phone_number }
    dni { Faker::IDNumber.valid }
  end

  factory :identity_with_user, parent: :identity do
    association :user
  end
end
