# frozen_string_literal: true

module OnboardingServices
  module RegisterUser
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
        model = User.new
        model.name = params[:name]
        model.username = params[:username]
        model.email = params[:email]
        model.password_digest = params[:password]
        model.company_id = params[:company_id]

        if model.save
          Success(model)
        else
          Failure(model.errors.full_messages.to_sentence)
        end
      end

      def output(model)
        response = {
          id: model.id.to_s,
          name: model.name,
          username: model.username,
          email: model.email,
          registered_at: model.created_at.strftime('%d/%m/%Y %H:%M')
        }
        Success(response)
      end
    end
  end
end
