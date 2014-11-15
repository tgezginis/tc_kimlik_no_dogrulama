
def numeric?(str)
  !!(str =~ /\A[[:digit:]]+\Z/)
end

def verify(tcKimlikNo)
  tcKimlikNo = tcKimlikNo.to_s
  if (tcKimlikNo.length != 11 || tcKimlikNo.nil? || !numeric?(tcKimlikNo))
    return false
  end

  if (tcKimlikNo[0] == 0)
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

  if(sum_odd * 7 - sum_even) % 10 == digits[9]
    return true
  end

  if sum % 10 == digits[10]
    return true
  end

  return false
end

if verify(08071470110)
  puts("This is a VALID TCKN")
else
  puts("INVALID TCKN")
end
