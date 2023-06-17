# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password_digest { Faker::Internet.password(min_length: 8) }
    token_password_recovery { rand(1..999) }
    token_password_recovery_deadline { '2023-06-17 15:28:41' }
    token_password_confirmation { rand(1..999) }
    token_password_confirmation_deadline { '2023-06-17 15:28:41' }
    company
    username { Faker::Internet.username }
  end
end
