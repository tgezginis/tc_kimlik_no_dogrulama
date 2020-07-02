# frozen_string_literal: true

Dir[File.join(__dir__, 'validations', '*.rb')].sort.each { |file| require file }

module TcKimlikNoDogrulama
  class Verifier
    VALIDATORS = %i[length format numericality].freeze

    attr_reader :identifier

    def initialize(identifier)
      @identifier = identifier
    end

    def valid?
      VALIDATORS.all? do |validator|
        validator_service(validator).new(identifier).valid?
      end
    end

    private

    def class_name(validator)
      validator.to_s.capitalize
    end

    def validator_service(validator)
      Object.const_get "::TcKimlikNoDogrulama::Validations::#{class_name(validator)}"
    end
  end
end
