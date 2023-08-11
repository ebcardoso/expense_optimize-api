require 'rails_helper'

RSpec.describe Resource, type: :model do
  describe 'associations' do
    it { should have_many(:permissions).dependent(:destroy) }
  end

  describe 'validations' do
    it do
      should validate_presence_of(:description)
      should validate_length_of(:description).is_at_most(255)
    end

    it do
      should validate_presence_of(:name)
      should validate_length_of(:name).is_at_most(255)
    end

    it { should validate_presence_of(:type) }
  end

  describe 'enum' do
    it { should define_enum_for(:type).with_values(%i[symbol model]).with_prefix(:type) }
  end

  describe 'scopes' do
    let(:resource) { create(:resource) }

    it 'search' do
      expect(Resource.search(resource.name)).to eq([resource])
    end
  end
end