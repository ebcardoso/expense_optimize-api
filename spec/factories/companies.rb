# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    document { 'MyString' }
    legal_name { 'MyString' }
    trade_name { 'MyString' }
  end
end
