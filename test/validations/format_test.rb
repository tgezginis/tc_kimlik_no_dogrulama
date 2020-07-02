# frozen_string_literal: true

require_relative '../test_helper'
require 'tc_kimlik_no_dogrulama/validations/format'

class FormatValidatorTest < Minitest::Test
  def test_success
    assert_equal true, TcKimlikNoDogrulama::Validations::Format.new(18071470110).valid?
    assert_equal true, TcKimlikNoDogrulama::Validations::Format.new(74091671050).valid?
    assert_equal true, TcKimlikNoDogrulama::Validations::Format.new(68461383032).valid?
  end

  def test_starts_with_zero
    assert_equal false, TcKimlikNoDogrulama::Validations::Format.new('01234567890').valid?
  end

  def test_modulo_check
    assert_equal false, TcKimlikNoDogrulama::Validations::Format.new(30402050302).valid?
    assert_equal false, TcKimlikNoDogrulama::Validations::Format.new(12345678901).valid?
  end

  def test_digits
    identifier = '30402050302'
    digits = identifier.each_char.map(&:to_i)
    assert_equal digits, TcKimlikNoDogrulama::Validations::Format.new(identifier).send('digits')
  end
end
