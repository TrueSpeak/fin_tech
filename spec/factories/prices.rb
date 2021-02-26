# frozen_string_literal: true

FactoryBot.define do
  factory :price do
    stock
    value { 'MyString' }
    completed { false }
  end
end
