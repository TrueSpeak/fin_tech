FactoryBot.define do
  factory :stock do
    ticker { Faker::Number.number.to_s }
    open { Faker::Number.number.to_s }
    day_high { Faker::Number.number.to_s }
    day_low { Faker::Number.number.to_s }
    prev_close { Faker::Number.number.to_s }
    market_capitalization { Faker::Number.number.to_s }
    size { Faker::Number.number.to_s }
    dividends { Faker::Number.number.to_s }
    change_per_year { Faker::Number.number.to_s }
  end
end
