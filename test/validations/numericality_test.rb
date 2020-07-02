# frozen_string_literal: true

require_relative '../test_helper'
require 'tc_kimlik_no_dogrulama/validations/numericality'

class NumericalityValidatorTest < Minitest::Test
  def test_success
    assert_equal true, TcKimlikNoDogrulama::Validations::Numericality.new(123).valid?
  end

  def test_fail
    assert_equal false, TcKimlikNoDogrulama::Validations::Numericality.new('abc123').valid?
    assert_equal false, TcKimlikNoDogrulama::Validations::Numericality.new('string').valid?
  end
end
