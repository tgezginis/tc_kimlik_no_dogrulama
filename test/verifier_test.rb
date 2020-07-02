# frozen_string_literal: true

require 'minitest/autorun'
require 'tc_kimlik_no_dogrulama/verifier'

class VerifierTest < Minitest::Test
  def sample_verifier
    TcKimlikNoDogrulama::Verifier.new(18071470110)
  end

  def test_valid?
    assert_equal true, sample_verifier.valid?
  end

  def test_validators
    assert_equal 3, TcKimlikNoDogrulama::Verifier::VALIDATORS.count
    assert_equal true, TcKimlikNoDogrulama::Verifier::VALIDATORS == [
      TcKimlikNoDogrulama::Validations::Length,
      TcKimlikNoDogrulama::Validations::Format,
      TcKimlikNoDogrulama::Validations::Numericality
    ]
  end
end
