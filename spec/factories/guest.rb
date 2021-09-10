FactoryBot.define do
  factory :guest do
    first_name { "Adnan" }
    last_name { "Pirota" }
    phone { ['1234567', '63532423']}
    email { "#{first_name}.#{last_name}@example.com".downcase }
  end
end