require "tc_kimlik_no_dogrulama/version"

module TcKimlikNoDogrulama
  def self.verify(tcKimlikNo)
    tcKimlikNo = tcKimlikNo.to_s

    # Kontrol 1: TC Kimlik numarası boş olmamalıdır.
    # Kontrol 2: T.C. Kimlik numarası 11 karakter olmalıdır.
    # Kontrol 3: T.C. Kimlik numarasının tüm karakterleri sayı olmalıdır.
    # Kontrol 4: T.C. Kimlik numarası 0 ile başlayamaz.
    if ((!tcKimlikNo.nil?) && (tcKimlikNo.length == 11) && (numeric?(tcKimlikNo)) && (tcKimlikNo[0] != 0))
      digits = tcKimlikNo.each_char.map(&:to_i)

      sum = 0
      sum_odd = 0
      sum_even = 0
      digits[0..9].each_with_index do |value, i|
        sum += value
        if i.even?
          sum_even += value
        else
          sum_odd += value
        end
      end

      # 2 Adet Kontrol
      # Kontrol #1: 1 3 5 7 ve 9 hanelerinin toplamının 7 katından, 2 4 6 ve 8 hanelerin toplamı çıkartıldığında,
      # elde edilen sonucun 10'a bölümünden kalan sayı,
      # yani Mod 10'u bize 10. haneyi vermelidir.
      # Kontrol #2: 1 2 3 4 5 6 7 8 9 ve 10 hanelerinin toplamından elde edilen sonucun
      # 10'a bölümünden kalan sayı, yani Mod 10'u bize 11. haneyi vermelidir.
      if (((sum_odd * 7 - sum_even) % 10 == digits[9]) || (sum % 10 == digits[10]))
        return true
      else
        return false
      end
    else
      return false
    end
  end

  private
  def self.numeric?(str)
    !!(str =~ /\A[[:digit:]]+\Z/)
  end
end