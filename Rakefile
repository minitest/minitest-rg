# -*- ruby -*-

require "rubygems"
require "hoe"

Hoe.plugin :gemspec  # `gem install hoe-gemspec`
Hoe.plugin :git      # `gem install hoe-git`
Hoe.plugin :minitest # `gem install hoe-minitest`

Hoe.spec "minitest-rg" do
  developer "Mike Moore", "mike@blowmage.com"

  self.summary     = "Red/Green for MiniTest"
  self.description = "Colored red/green output for Minitest"
  self.urls        = ["http://blowmage.com/minitest-rg"]
  self.license       "MIT"

  self.readme_file       = "README.rdoc"
  self.history_file      = "CHANGELOG.rdoc"

  dependency "minitest",  "~> 5.0"
  dependency "rubocop",   "~> 0.37", :dev
end

# vim: syntax=ruby

task :sanity do
  puts "="*72
  puts "Running a \e[32mpassing\e[0m test:"
  puts "="*72
  puts
  puts `script -q /dev/null ./scripts/run_pass`
  puts

  puts "="*72
  puts "Running a \e[31mfailing\e[0m test:"
  puts "="*72
  puts
  puts `script -q /dev/null ./scripts/run_fail`
  puts

  puts "="*72
  puts "Running a \e[33merroring\e[0m test:"
  puts "="*72
  puts
  puts `script -q /dev/null ./scripts/run_error`
  puts

  puts "="*72
  puts "Running a \e[36mskipped\e[0m test:"
  puts "="*72
  puts
  puts `script -q /dev/null ./scripts/run_skip`
  puts
end

require "rubocop/rake_task"

RuboCop::RakeTask.new
