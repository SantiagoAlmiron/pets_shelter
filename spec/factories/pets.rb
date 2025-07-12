FactoryBot.define do
  factory :pet do
    name { Faker::Creature::Dog.name }
    age { Faker::Number.between(from: 1, to: 15) }
    about_pet { Faker::Lorem.paragraph }
    physical_characteristics { Faker::Lorem.sentence }
    personality { Faker::Lorem.sentence }
    sociable { Faker::Boolean.boolean }
    weight { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    status { 'in_evaluation' }
    spot { Faker::Number.between(from: 1, to: 100) }
    entry_date { Faker::Time.backward(days: 30) }
    exit_date { nil }
  end
end
