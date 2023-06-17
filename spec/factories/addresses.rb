# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    zip_code { Faker::Address.zip_code }
    address { Faker::Address.street_name }
    address_number { Faker::Address.building_number }
    complement { Faker::Address.secondary_address }
    state { Faker::Address.state_abbr }
    city { Faker::Address.city }
    neighborhood { Faker::Address.community }

    after :build, &:addressable
  end
end
