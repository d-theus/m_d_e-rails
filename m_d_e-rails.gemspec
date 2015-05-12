# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'm_d_e/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "m_d_e-rails"
  spec.version       = MDE::Rails::VERSION
  spec.authors       = ["d-theus"]
  spec.email         = ["slma0x02@gmail.com"]

  spec.summary       = 'Markdown editor for rails'
  spec.description   = 'Two sided editor with preview. Using ace editor and marked parser, coffee.'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "coffee-rails"
  spec.add_dependency "ace-rails-ap"
  spec.add_dependency "marked-rails"
end
