# -*- encoding: utf-8 -*-
# stub: minitest-rg 5.2.0.20160225093841 ruby lib

Gem::Specification.new do |s|
  s.name = "minitest-rg"
  s.version = "5.2.0.20160225093841"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Mike Moore"]
  s.date = "2016-02-25"
  s.description = "Colored red/green output for Minitest"
  s.email = ["mike@blowmage.com"]
  s.extra_rdoc_files = ["CHANGELOG.rdoc", "Manifest.txt", "README.rdoc"]
  s.files = [".autotest", ".gemtest", ".rubocop.yml", "CHANGELOG.rdoc", "Gemfile", "LICENSE", "Manifest.txt", "README.rdoc", "Rakefile", "lib/minitest/rg.rb", "lib/minitest/rg_plugin.rb", "minitest-rg.gemspec", "scripts/run_error", "scripts/run_fail", "scripts/run_pass", "scripts/run_skip", "test/test_rg.rb"]
  s.homepage = "https://github.com/minitest/minitest-rg"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--main", "README.rdoc"]
  s.rubygems_version = "2.5.1"
  s.summary = "Red/Green for Minitest"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<minitest>, ["~> 5.0"])
      s.add_development_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_development_dependency(%q<rubocop>, ["~> 0.37"])
      s.add_development_dependency(%q<hoe>, ["~> 3.14"])
    else
      s.add_dependency(%q<minitest>, ["~> 5.0"])
      s.add_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_dependency(%q<rubocop>, ["~> 0.37"])
      s.add_dependency(%q<hoe>, ["~> 3.14"])
    end
  else
    s.add_dependency(%q<minitest>, ["~> 5.0"])
    s.add_dependency(%q<rdoc>, ["~> 4.0"])
    s.add_dependency(%q<rubocop>, ["~> 0.37"])
    s.add_dependency(%q<hoe>, ["~> 3.14"])
  end
end
