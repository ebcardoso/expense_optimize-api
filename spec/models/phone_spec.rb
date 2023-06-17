# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Phone, type: :model do
  it { is_expected.to validate_presence_of(:phone_number) }
  it { is_expected.to validate_uniqueness_of(:phone_number).case_insensitive }
  it { is_expected.to define_enum_for(:phone_type).with_values({ personal: 0, commercial: 1 }) }

  it { is_expected.to belong_to(:phoneble) }
end
