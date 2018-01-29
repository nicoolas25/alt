lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "alt/version"

Gem::Specification.new do |spec|
  spec.name          = "alt"
  spec.version       = Alt::VERSION
  spec.authors       = ["Nicolas Zermati"]
  spec.email         = ["nicoolas25@gmail.com"]

  spec.summary       = %q{Navigate easily in a projet by using conventions}
  spec.description   = %q{}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "hanami-cli"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-rspec"
end
