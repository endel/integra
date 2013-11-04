# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'integra/version'

Gem::Specification.new do |spec|
  spec.name          = Integra::NAME
  spec.version       = Integra::VERSION
  spec.authors       = ["Endel Dreyer"]
  spec.email         = ["endel.dreyer@gmail.com"]

  spec.description   = %q{A nice set of defaults for integration tests, no matter what language your application is written in.}
  spec.summary       = %q{Integration testing tools.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'rspec', '>= 2.14.1'
  spec.add_dependency 'poltergeist', '>= 1.4.1'
  spec.add_dependency 'capybara', '>= 2.1.0'
  spec.add_dependency 'turnip', '>= 1.1.0'
  spec.add_dependency 'turnip_formatter', '>= 0.2.7'
  spec.add_dependency 'gnawrnip', '>= 0.1.3'
  spec.add_dependency 'colorize', '>= 0.6.0'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
