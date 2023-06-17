# frozen_string_literal: true

class Phone < ApplicationRecord
  # Validates
  validates :phone_type, :phone_number, presence: true
  validates :phone_number, uniqueness: { case_sensitive: false }

  # Enumerates
  enum phone_type: %i[personal commercial]

  # relationships
  belongs_to :phoneble, polymorphic: true
end
