# frozen_string_literal: true

module OnboardingServices
  module AddPhoneCompany
    class Contract < ApplicationContract
      schema do
        required(:phone_type).value(:integer)
        required(:phone_number).value(:string)
        required(:company_id).value(:string)
      end
    end
  end
end
