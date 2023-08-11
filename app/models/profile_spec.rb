require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'associations' do
    it { should have_one(:user_profile) }
    it { should have_many(:user_profiles) }
    it { should have_many(:permissions).dependent(:destroy) }
    it { should have_many(:users).through(:user_profiles) }
  end

  describe 'validations' do
    it { should validate_presence_of(:description) }
    it { should validate_uniqueness_of(:description).case_insensitive }
    it { should validate_length_of(:description).is_at_most(255) }
    it { should accept_nested_attributes_for(:permissions) } 
  end

  describe 'scopes' do
    let(:profile) { create(:profile) }

    it 'search' do
      expect(Profile.search(profile.id)).to eq([profile])
    end
  end
end
