# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    document { Faker::Company.brazilian_company_number }
    legal_name { Faker::Company.name }
    trade_name { Faker::Company.suffix }
    address
    phone
  end
end
