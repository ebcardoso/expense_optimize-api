# frozen_string_literal: true

module OnboardingServices
  module AddPhoneCompany
    class Transaction < MainService
      step :validate_inputs
      step :persist_model
      step :output

      def validate_inputs(params)
        validation = Contract.call(params.permit!.to_h)

        if validation.success?
          Success(params)
        else
          Failure[I18n.t('params.invalid'), validation.errors.to_h]
        end
      end

      def persist_model(params)
        model = Phone.new
        model.phone_type = params[:phone_type]
        model.phone_number = params[:phone_number]
        model.phoneble_type = 'Company'
        model.phoneble_id = params[:company_id]

        if model.save
          Success(model)
        else
          debugger
          Failure(model.errors.full_messages.to_sentence)
        end
      end

      def output(model)
        response = {
          id: model.id.to_s,
          phone_type: model.phone_type,
          phone_number: model.phone_number,
          registered_at: model.created_at.strftime('%d/%m/%Y %H:%M')
        }
        Success(response)
      end
    end
  end
end
