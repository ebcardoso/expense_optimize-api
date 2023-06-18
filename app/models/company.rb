# frozen_string_literal: true

class Company < ApplicationRecord
  # Validates
  validates :document, :legal_name, :trade_name, presence: true
  validates :document, :legal_name, uniqueness: { case_sensitive: false }

  # relationships
  has_one :address, as: :addressable, dependent: :destroy
  has_many :phones, as: :phoneble, dependent: :destroy
  has_many :users, dependent: :destroy
end
