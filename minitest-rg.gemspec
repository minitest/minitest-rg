# frozen_string_literal: true

require File.expand_path("lib/minitest/rg_version.rb", __dir__)

Gem::Specification.new do |gem|
  gem.name          = "minitest-rg"
  gem.version       = Minitest::RedGreenIO::VERSION

  gem.authors       = ["Mike Moore"]
  gem.email         = ["mike@blowmage.com"]
  gem.description   = "Colored red/green output for Minitest"
  gem.summary       = "Red/Green for Minitest"
  gem.homepage      = "https://minitest.github.io/minitest-rg/"
  gem.license       = "MIT"

  gem.files         = `git ls-files -- lib/*`.split("\n") +
                      ["README.md", "CHANGELOG.md", "LICENSE"]
  gem.require_paths = ["lib"]

  gem.required_ruby_version = ">= 3.2"

  gem.add_dependency "minitest", "~> 6.0"

  gem.add_development_dependency "rake", "~> 13.0"
  gem.add_development_dependency "rdoc", "~> 7.0"
  gem.add_development_dependency "rubocop", "~> 1.82.0"
  gem.metadata["rubygems_mfa_required"] = "true"
end
