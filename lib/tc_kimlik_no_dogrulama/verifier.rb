# frozen_string_literal: true

Dir[File.join(__dir__, 'validations', '*.rb')].sort.each { |file| require file }

module TcKimlikNoDogrulama
  class Verifier
    VALIDATORS =
      [
        TcKimlikNoDogrulama::Validations::Length,
        TcKimlikNoDogrulama::Validations::Format,
        TcKimlikNoDogrulama::Validations::Numericality
      ].freeze

    attr_reader :identifier

    def initialize(identifier)
      @identifier = identifier
    end

    def valid?
      VALIDATORS.all? do |validator|
        validator.new(identifier).valid?
      end
    end
  end
end
