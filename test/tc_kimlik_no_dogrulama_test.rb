require 'minitest/autorun'
require 'tc_kimlik_no_dogrulama'

class TcKimlikNoDogrulamaTest < Minitest::Test
  def test_dogru_numaralar
    assert_equal true, TcKimlikNoDogrulama::verify(18071470110)
    assert_equal true, TcKimlikNoDogrulama::verify(74091671050)
    assert_equal true, TcKimlikNoDogrulama::verify(68461383032)
  end
  def test_yanlis_numaralar
    assert_equal false, TcKimlikNoDogrulama::verify(0)
    assert_equal false, TcKimlikNoDogrulama::verify("string")
    assert_equal false, TcKimlikNoDogrulama::verify(30402050302)
  end
end
