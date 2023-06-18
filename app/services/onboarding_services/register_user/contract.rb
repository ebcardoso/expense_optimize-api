# frozen_string_literal: true

module OnboardingServices
  module RegisterUser
    class Contract < ApplicationContract
      schema do
        required(:name).value(:string)
        required(:username).value(:string)
        required(:email).value(:string)
        required(:password).value(:string)
      end
    end
  end
end
