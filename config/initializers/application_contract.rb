# frozen_string_literal: true

class ApplicationContract < Dry::Validation::Contract
  require 'dry/validation'

  config.messages.default_locale = 'pt-BR'
  config.messages.backend = :i18n

  def self.call(*args, &block)
    new.call(*args, &block)
  end
end
