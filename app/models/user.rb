# frozen_string_literal: true

class User < ApplicationRecord
  # Validates
  validates :name, :username, :email, :password_digest, presence: true
  validates :email, :username, uniqueness: { case_sensitive: false, scope: :company }

  # relationships
  has_one :address, as: :addressable
  has_many :phones, as: :phoneble
  belongs_to :company
end
