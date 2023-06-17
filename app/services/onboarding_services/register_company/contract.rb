# frozen_string_literal: true

module OnboardingServices
  module RegisterCompany
    class Contract < ApplicationContract
      schema do
        required(:document).value(:string)
        required(:legal_name).value(:string)
        required(:trade_name).value(:string)
      end

      rule(:document) do
        key.failure('Document must to have at least 14 characters') if value.length < 14
      end
    end
  end
end
