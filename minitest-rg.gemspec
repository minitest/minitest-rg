# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "minitest-rg"
  s.version = "1.0.0.20120728083442"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mike Moore"]
  s.date = "2012-07-28"
  s.description = "Adds color to your MiniTest output"
  s.email = ["mike@blowmage.com"]
  s.extra_rdoc_files = ["CHANGELOG.rdoc", "Manifest.txt", "README.rdoc"]
  s.files = [".autotest", "CHANGELOG.rdoc", "LICENSE", "Manifest.txt", "README.rdoc", "Rakefile", "lib/minitest/rg.rb", "minitest-rg.gemspec", "test/test_minitest-rg.rb", ".gemtest"]
  s.homepage = "http://blowmage.com/minitest-rg"
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "minitest-rg"
  s.rubygems_version = "1.8.24"
  s.summary = "RedGreen for MiniTest"
  s.test_files = ["test/test_minitest-rg.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<minitest>, ["~> 3.2"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.10"])
      s.add_development_dependency(%q<hoe>, ["~> 3.0"])
    else
      s.add_dependency(%q<minitest>, ["~> 3.2"])
      s.add_dependency(%q<rdoc>, ["~> 3.10"])
      s.add_dependency(%q<hoe>, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<minitest>, ["~> 3.2"])
    s.add_dependency(%q<rdoc>, ["~> 3.10"])
    s.add_dependency(%q<hoe>, ["~> 3.0"])
  end
end
