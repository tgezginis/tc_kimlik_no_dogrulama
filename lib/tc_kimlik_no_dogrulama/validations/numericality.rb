# frozen_string_literal: true

module TcKimlikNoDogrulama::Validations
  class Numericality
    REGEX = /\A[[:digit:]]+\Z/.freeze

    def initialize(value)
      # T.C. Kimlik numarasının tüm karakterleri sayı olmalıdır.
      @value = value.to_s
    end

    def valid?
      REGEX.match?(@value)
    end
  end
end
