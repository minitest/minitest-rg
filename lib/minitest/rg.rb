# frozen_string_literal: true

require "minitest"

Minitest.load :rg
Minitest::RedGreenIO.rg! color: $stdout.tty?
