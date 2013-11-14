# -*- ruby -*-

require 'rubygems'
require 'hoe'

Hoe.plugin :gemspec  # `gem install hoe-gemspec`
Hoe.plugin :git      # `gem install hoe-git`
Hoe.plugin :minitest # `gem install hoe-minitest`
Hoe.plugins.delete :rubyforge

Hoe.spec 'minitest-rg' do
  developer 'Mike Moore', 'mike@blowmage.com'

  self.summary     = 'RedGreen for MiniTest'
  self.description = 'Adds color to your MiniTest output'
  self.urls        = ['http://blowmage.com/minitest-rg']

  self.readme_file       = 'README.rdoc'
  self.history_file      = 'CHANGELOG.rdoc'

  dependency 'minitest',  '~> 5.0'
end

# vim: syntax=ruby
