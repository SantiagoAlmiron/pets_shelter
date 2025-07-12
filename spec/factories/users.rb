FactoryBot.define do
  factory :user do
    email do
      username = Faker::Internet.unique.username(specifier: 5..10)
      domain = EmailDomainValidator::VALID_DOMAINS.sample
      "#{username}@#{domain}"
    end
    password { 'Abc123!' }
  end
end
