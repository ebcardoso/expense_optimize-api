FactoryBot.define do
  factory :permission do
    association :resource
    association :profile
    read { 1 }
    create { 1 }
    edit { 1 }
    exclude { 1 }

    trait :admin do |evaluator|
      resource_id { evaluator.resource_id }
      profile_id { evaluator.profile_id }
    end
  end
end