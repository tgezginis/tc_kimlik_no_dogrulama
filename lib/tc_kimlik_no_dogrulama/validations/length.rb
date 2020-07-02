# frozen_string_literal: true

module TcKimlikNoDogrulama::Validations
  class Length
    CHARACTER_LENGTH = 11

    def initialize(value)
      @value = value.to_s
    end

    def valid?
      # T.C. Kimlik numarası 11 karakter olmalıdır.
      @value.length == CHARACTER_LENGTH
    end
  end
end
