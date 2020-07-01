# frozen_string_literal: true

module TcKimlikNoDogrulama
  class Verifier
    attr_reader :identifier

    def initialize(identifier)
      @identifier = identifier.to_s
    end

    def valid?
      # Kontrol 1: T.C. Kimlik numarası boş olmamalıdır.
      # Kontrol 2: T.C. Kimlik numarası 0 ile başlayamaz.
      # Kontrol 3: T.C. Kimlik numarası 11 karakter olmalıdır.
      # Kontrol 4: T.C. Kimlik numarasının tüm karakterleri sayı olmalıdır.

      return false if identifier.nil? || valid_first_character?
      return false unless valid_character_length?
      return false unless numeric?

      calculate_sums
      validate
    end

    private

    attr_accessor :sum, :sum_odd, :sum_even

    def numeric?
      !!(identifier =~ /\A[[:digit:]]+\Z/)
    end

    def valid_first_character?
      identifier.chr == '0'
    end

    def valid_character_length?
      identifier.length == 11
    end

    def digits
      @digits ||= identifier.each_char.map(&:to_i)
    end

    def calculate_sums
      @sum ||= 0
      @sum_odd ||= 0
      @sum_even ||= 0

      digits[0..9].each_with_index do |value, index|
        @sum += value
        index.even? ? @sum_even += value : @sum_odd += value
      end
    end

    def validate
      # Kontrol 1: 1 3 5 7 ve 9 hanelerinin toplamının 7 katından, 2 4 6 ve 8
      # hanelerin toplamı çıkartıldığında, elde edilen sonucun 10'a bölümünden
      # kalan sayı, yani Mod 10'u bize 10. haneyi vermelidir.
      # Kontrol 2: 1 2 3 4 5 6 7 8 9 ve 10 hanelerinin toplamından elde edilen sonucun
      # 10'a bölümünden kalan sayı, yani Mod 10'u bize 11. haneyi vermelidir.
      
      (sum_odd * 7 - sum_even) % 10 == digits[9] || sum % 10 == digits[10]
    end
  end
end
