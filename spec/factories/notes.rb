# frozen_string_literal: true

FactoryBot.define do
  factory :note do
    title { Faker::Lorem.word }
    description { Faker::Lorem.word }
    private_note { false }
  end
end
