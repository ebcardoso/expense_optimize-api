# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company, type: :model do
  it { is_expected.to validate_presence_of(:document) }
  it { is_expected.to validate_uniqueness_of(:document).case_insensitive }
  it { is_expected.to validate_presence_of(:legal_name) }
  it { is_expected.to validate_uniqueness_of(:legal_name).case_insensitive }
end
