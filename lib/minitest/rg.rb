require "minitest"

Minitest.load_plugins
Minitest::RG.rg! if $stdout.tty?
