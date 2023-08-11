FactoryBot.define do
  factory :user_profile do
    association :user
    association :profile

    trait :admin do |evaluator|
      user_id { evaluator.user_id }
      profile_id { evaluator.profile_id }
    end

    trait :with_organizations do
      after(:build) do |user_profile|
        user_profile.user_profile_organizations << FactoryBot.build(:user_profile_organization, user_profile_id: user_profile.id, organization_id: create(:organization).id)
      end
    end
  end
end