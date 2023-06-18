# frozen_string_literal: true

module OnboardingServices
  module RegisterCompany
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
        model = Company.new
        model.legal_name = params[:legal_name]
        model.trade_name = params[:trade_name]
        model.document = params[:document]

        if model.save
          Success(model)
        else
          Failure(model.errors.full_messages.to_sentence)
        end
      end

      def output(model)
        response = {
          id: model.id.to_s,
          document: model.document,
          trade_name: model.trade_name,
          legal_name: model.legal_name,
          registered_at: model.created_at.strftime('%d/%m/%Y %H:%M')
        }
        Success(response)
      end
    end
  end
end
