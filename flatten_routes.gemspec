# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flatten_routes/version'

Gem::Specification.new do |spec|
  spec.name          = 'flatten_routes'
  spec.version       = FlattenRoutes::VERSION
  spec.authors       = ['Kazuhiro Serizawa']
  spec.email         = ['nserihiro@gmail.com']

  spec.summary       = %q{Convert the routes.rb to not using resource style.}
  spec.description   = %q{Convert the routes.rb to not using resource style.}
  spec.homepage      = 'https://github.com/serihiro/flatten_routes'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'actionpack', '~> 6.1.3'
end
