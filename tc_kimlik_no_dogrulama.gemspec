# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tc_kimlik_no_dogrulama/version'

Gem::Specification.new do |spec|
  spec.name          = "tc_kimlik_no_dogrulama"
  spec.version       = TcKimlikNoDogrulama::VERSION
  spec.authors       = ["Tolga Gezginiş"]
  spec.email         = ["tolga@gezginis.com"]
  spec.summary       = %q{T.C. Kimlik No Doğrulama}
  spec.description   = %q{Ruby için hazırlanmış T.C. Kimlik Numarası doğrulama sistemi}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
