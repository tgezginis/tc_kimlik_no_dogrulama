# frozen_string_literal: true

module TcKimlikNoDogrulama::Validations
  class Format
    def initialize(value)
      @value = value.to_s
      @sum = 0
      @sum_odd = 0
      @sum_even = 0

      digits[0..9].each_with_index do |number, index|
        @sum += number
        index.even? ? @sum_even += number : @sum_odd += number
      end
    end

    def valid?
      return false if starts_with_zero?

      # Kontrol 1: 1 3 5 7 ve 9 hanelerinin toplamının 7 katından, 2 4 6 ve 8
      # hanelerin toplamı çıkartıldığında, elde edilen sonucun 10'a bölümünden
      # kalan sayı, yani Mod 10'u bize 10. haneyi vermelidir.
      # Kontrol 2: 1 2 3 4 5 6 7 8 9 ve 10 hanelerinin toplamından elde edilen sonucun
      # 10'a bölümünden kalan sayı, yani Mod 10'u bize 11. haneyi vermelidir.

      (sum_odd * 7 - sum_even) % 10 == digits[9] || sum % 10 == digits[10]
    end

    private

    attr_accessor :sum, :sum_odd, :sum_even

    def starts_with_zero?
      # T.C. Kimlik numarası 0 ile başlayamaz.
      @value.chr == '0'
    end

    def digits
      @digits ||= @value.each_char.map(&:to_i)
    end
  end
end
