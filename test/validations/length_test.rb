# frozen_string_literal: true

require_relative '../test_helper'
require 'tc_kimlik_no_dogrulama/validations/length'

class LengthValidatorTest < Minitest::Test
  def test_success
    assert_equal true, TcKimlikNoDogrulama::Validations::Length.new(12345678901).valid?
    assert_equal true, TcKimlikNoDogrulama::Validations::Length.new('string01234').valid?
  end

  def test_fail
    assert_equal false, TcKimlikNoDogrulama::Validations::Length.new(1234).valid?
  end
end
