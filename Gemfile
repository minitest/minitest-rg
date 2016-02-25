source "https://rubygems.org"

require "rubygems" # Needed for ruby 1.8.7

gem "minitest", "~> 5.0"
gem "hoe",      "~> 3.11", :group => :development
gem "rubocop",  "~> 0.37", :group => :development
if Gem::Version.new("#{RUBY_VERSION}") <= Gem::Version.new("1.8.7")
  # Specify the last version of rainbow supported by ruby 1.8.7
  gem "rainbow", "1.99.2", :group => :development
end
