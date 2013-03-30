#encoding: UTF-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'standalone_typograf/version'

Gem::Specification.new do |spec|
  spec.name          = 'standalone_typograf'
  spec.version       = StandaloneTypograf::VERSION
  spec.authors       = 'Alex Shilov'
  spec.email         = 'sashapashamasha@gmail.com'
  spec.description   = "Standalone (offline) client of the ArtLebedev's Studio Typograf service."
  spec.summary       = 'Fast&Simple'
  spec.homepage      = 'https://github.com/shlima/StandaloneTypograf'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
