# frozen_string_literal: true

module Api
  class OnboardingController < ApplicationController
    def register_company
      OnboardingServices::RegisterCompany::Transaction.call(params) do |on|
        on.failure(:validate_inputs) { |message, content| render json: { message:, content: }, status: 400 }
        on.failure(:persist_model) { |message| render json: { message:, content: {} }, status: 500 }
        on.failure { |response| render json: response, status: 500 }
        on.success { |response| render json: response, status: 200 }
      end
    end

    def add_address_company
      OnboardingServices::AddAddressCompany::Transaction.call(params) do |on|
        on.failure(:validate_inputs) { |message, content| render json: { message:, content: }, status: 400 }
        on.failure(:persist_model) { |message| render json: { message:, content: {} }, status: 500 }
        on.failure { |response| render json: response, status: 500 }
        on.success { |response| render json: response, status: 200 }
      end
    end

    def add_phone_company
      OnboardingServices::AddPhoneCompany::Transaction.call(params) do |on|
        on.failure(:validate_inputs) { |message, content| render json: { message:, content: }, status: 400 }
        on.failure(:persist_model) { |message| render json: { message:, content: {} }, status: 500 }
        on.failure { |response| render json: response, status: 500 }
        on.success { |response| render json: response, status: 200 }
      end
    end

    def register_user
      OnboardingServices::RegisterUser::Transaction.call(params) do |on|
        on.failure(:validate_inputs) { |message, content| render json: { message:, content: }, status: 400 }
        on.failure(:persist_model) { |message| render json: { message:, content: {} }, status: 500 }
        on.failure { |response| render json: response, status: 500 }
        on.success { |response| render json: response, status: 200 }
      end
    end
  end
end
