# frozen_string_literal: true

require 'tc_kimlik_no_dogrulama/version'
require 'tc_kimlik_no_dogrulama/verifier'

module TcKimlikNoDogrulama
  def self.verify(identifier)
    verifier = TcKimlikNoDogrulama::Verifier.new(identifier)
    verifier.valid?
  end
end
