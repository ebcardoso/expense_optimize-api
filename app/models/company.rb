# frozen_string_literal: true

class Company < ApplicationRecord
  # Validates
  validates :document, :legal_name, :trade_name, presence: true
  validates :document, :legal_name, uniqueness: { case_sensitive: false }
end
