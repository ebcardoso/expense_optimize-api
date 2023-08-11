FactoryBot.define do
  factory :profile do
    description { Faker::Lorem.paragraph_by_chars(number: 254, supplemental: false) }

    trait :admin do
      after(:create) do |profile|
        resource = FactoryBot.create(:resource, :admin)
        resource = FactoryBot.create(:permission, :admin, resource_id: resource.id, profile_id: profile.id)
      end
    end

    trait :with_params do |evaluator|
      id { evaluator.id }
    end
  end
end