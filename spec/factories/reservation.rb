FactoryBot.define do
  factory :reservation do
    code { "SERGASDFFES#2354" }
    start_date { Date.today}
    end_date { Date.today + 10.days }
    guest { guest }
    payout_price { 3500 }
    security_price { 700 }
    total_price { 4200 }
    currency { "AUD" }
    paid_amount { 0 }
    nights { 4 }
    number_of_guests { 4 }
    number_of_adults { 2 }
    number_of_children { 2 }
    number_of_infants { 0 }
    status { "accepted" }
  end
end