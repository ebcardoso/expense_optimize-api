require 'rails_helper'

RSpec.describe UserProfile, type: :model do
  describe 'validations' do
    it { should belong_to(:user) }
    it { should belong_to(:profile) }
    it { should have_many(:user_profile_organizations).dependent(:destroy) }
    it { should have_many(:organizations).through(:user_profile_organizations).dependent(:destroy) }
  end

  describe 'validations' do
    subject { FactoryBot.build(:user_profile, user_id: create(:user, :with_context).id, profile_id: create(:profile).id) }
    it { should validate_uniqueness_of(:user_id).scoped_to(:profile_id) }
  end

  describe 'scopes' do
    let(:user) { create(:user) }
    let(:user_profile) { create(:user_profile, user_id: user.id) }

    it 'select_list' do
      expect(UserProfile.select_list).to eq([user_profile])
    end

    it 'search' do
      expect(UserProfile.search(user.name)).to eq([user_profile])
    end
  end
end
