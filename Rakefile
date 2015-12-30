# -*- ruby -*-

require 'bundler/setup'
require 'hoe'

Hoe.plugin :gemspec  # `gem install hoe-gemspec`
Hoe.plugin :git      # `gem install hoe-git`
Hoe.plugin :minitest # `gem install hoe-minitest`

Hoe.spec 'minitest-rg' do
  developer 'Mike Moore', 'mike@blowmage.com'

  self.summary     = 'Red/Green for MiniTest'
  self.description = 'Colored red/green output for Minitest'
  self.urls        = ['http://blowmage.com/minitest-rg']
  self.license       "MIT"

  self.readme_file       = 'README.rdoc'
  self.history_file      = 'CHANGELOG.rdoc'

  dependency 'minitest',  '~> 5.0'
end

Rake::Task[:default].clear
task :default do
  expected = "\e[36mS\e[0m\e[33mE\e[0m\e[31mF\e[0m\e[32m.\e[0m"
  result = `script -q /dev/null test/test_minitest-rg.rb`
  if result.include?(expected)
    raise "Result did not include #{expected}: #{result}"
  else
    puts "Looks good: #{expected}"
  end
end

# vim: syntax=ruby
