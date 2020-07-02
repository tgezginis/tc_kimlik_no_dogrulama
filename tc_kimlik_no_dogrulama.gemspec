# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tc_kimlik_no_dogrulama/version'

Gem::Specification.new do |spec|
  spec.name          = 'tc_kimlik_no_dogrulama'
  spec.version       = TcKimlikNoDogrulama::VERSION
  spec.authors       = ['Tolga Gezginiş']
  spec.email         = ['tolga@gezginis.com']
  spec.summary       = 'T.C. Kimlik No Doğrulama'
  spec.description   = 'Ruby için T.C. Kimlik Numarası doğrulama sistemi'
  spec.homepage      = 'https://github.com/tgezginis/tc_kimlik_no_dogrulama'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'rake', '>= 12.3.3'
end
