# frozen_string_literal: true

module OnboardingServices
  module AddAddressCompany
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
        model = Address.new
        model.zip_code = params[:zip_code]
        model.address = params[:address]
        model.address_number = params[:address_number]
        model.complement = params[:complement]
        model.neighborhood = params[:neighborhood]
        model.state = params[:state]
        model.city = params[:city]
        model.addressable_type = 'Company'
        model.addressable_id = params[:company_id]

        if model.save
          Success(model)
        else
          Failure(I18n.t('company.create.errors'))
        end
      end

      def output(model)
        response = {
          id: model.id.to_s,
          zip_code: model.zip_code,
          address: model.address,
          address_number: model.address_number,
          complement: model.complement,
          neighborhood: model.neighborhood,
          state: model.state,
          city: model.city,
          registered_at: model.created_at.strftime('%d/%m/%Y %H:%M')
        }
        Success(response)
      end
    end
  end
end
