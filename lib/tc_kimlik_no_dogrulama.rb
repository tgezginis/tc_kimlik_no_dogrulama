require "tc_kimlik_no_dogrulama/version"

module TcKimlikNoDogrulama
  def self.verify(tcKimlikNo)
    tcKimlikNo = tcKimlikNo.to_s

    # Kontrol 1: TC Kimlik No boş olmamalı
    # Kontrol 2: TC Kimlik No uzunluğu 11 karakter olmalı
    # Kontrol 3: TC Kimlik No sayılardan oluşmalı
    # Kontrol 4: TC Kimlik No ilk sayısı 0 olmamalı
    if (tcKimlikNo.nil? || tcKimlikNo.length != 11 || !numeric?(tcKimlikNo) || tcKimlikNo[0] == 0)
      return false
    end

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

    # Kontrol 1
    # 1. 3. 5. 7. ve 9. hanelerin toplamının 7 katından, 2. 4. 6. ve 8. hanelerin toplamı
    # çıkartıldığında, elde edilen sonucun 10'a bölümünden kalan, yani Mod10'u bize
    # 10. haneyi verir.
    if(sum_odd * 7 - sum_even) % 10 == digits[9]
      return true
    end

    # Kontrol 2
    # 1. 2. 3. 4. 5. 6. 7. 8. 9. ve 10. hanelerin toplamından elde edilen sonucun
    # 10'a bölümünden kalan, yani Mod10'u bize 11. haneyi verir.
    if sum % 10 == digits[10]
      return true
    end

    # TC Kimlik no kontrollerden geçemedi.
    return false
  end

  def self.numeric?(str)
    !!(str =~ /\A[[:digit:]]+\Z/)
  end
end