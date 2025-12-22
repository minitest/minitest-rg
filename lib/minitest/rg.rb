# frozen_string_literal: true

require "minitest"

Minitest.load :rg
Minitest::RG.rg! color: $stdout.tty?
