# frozen_string_literal: true

require_relative 'test_helper'
require 'tc_kimlik_no_dogrulama'

class TcKimlikNoDogrulamaTest < Minitest::Test
  def test_success
    assert_equal true, TcKimlikNoDogrulama.verify(18_071_470_110)
    assert_equal true, TcKimlikNoDogrulama.verify(74_091_671_050)
    assert_equal true, TcKimlikNoDogrulama.verify(68_461_383_032)
  end

  def test_fail
    assert_equal false, TcKimlikNoDogrulama.verify('01234567890')
    assert_equal false, TcKimlikNoDogrulama.verify('string')
    assert_equal false, TcKimlikNoDogrulama.verify(30_402_050_302)
    assert_equal false, TcKimlikNoDogrulama.verify(1234)
  end
end
