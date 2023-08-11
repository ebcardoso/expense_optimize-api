require 'rails_helper'

RSpec.describe Permission, type: :model do
  describe 'associations' do
    it { should belong_to(:resource) }
    it { should belong_to(:profile) }
  end

  describe 'validations' do
    subject { FactoryBot.build(:permission) }
    it { should validate_uniqueness_of(:profile_id).scoped_to(:resource_id) }
  end
end