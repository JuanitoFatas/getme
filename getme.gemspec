lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'getme/version'

Gem::Specification.new do |spec|
  spec.platform      = Gem::Platform::RUBY

  spec.name          = "getme"
  spec.version       = Getme::VERSION::STRING

  spec.description   = %q{Get Me Vendor Files!}
  spec.summary       = spec.description


  spec.authors       = ["Juanito Fatas"]
  spec.email         = ["katehuang0320@gmail.com"]
  spec.homepage      = "https://github.com/JuanitoFatas/getme"

  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "amatch", "~> 0.2.11"
  spec.add_dependency "thor"  , "~> 0.18.1"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~> 5.0.6"
end
