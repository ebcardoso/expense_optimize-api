# frozen_string_literal: true

FactoryBot.define do
  factory :phone do
    phone_type { rand(0..1) }
    phone_number { Faker::PhoneNumber.phone_number_with_country_code }

    after :build, &:phoneble
  end
end
