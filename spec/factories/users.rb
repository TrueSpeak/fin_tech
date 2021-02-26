# frozen_string_literal: true

FactoryBot.define do
  sequence :email do |n|
    "user#{n}@test.net"
  end

  factory :user do
    email
    password { 'test_password' }
    password_confirmation { 'test_password' }
  end
end
