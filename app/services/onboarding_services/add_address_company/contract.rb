# frozen_string_literal: true

module OnboardingServices
  module AddAddressCompany
    class Contract < ApplicationContract
      schema do
        required(:zip_code).value(:string)
        required(:address).value(:string)
        required(:address_number).value(:string)
        required(:neighborhood).value(:string)
        required(:state).value(:string)
        required(:city).value(:string)
        required(:company_id).value(:string)
      end

      rule(:zip_code) do
        key.failure('Zip Code must to have at least 8 characters') if value.length < 8
      end
    end
  end
end
