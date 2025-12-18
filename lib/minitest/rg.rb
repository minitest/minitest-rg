# frozen_string_literal: true

# Public: Convenience file to load the minitest-rg plugin and enable colors.
#
# Requiring this file automatically enables colored output when running in a
# TTY. Use `require "minitest/rg"` in your test helper for automatic setup.

require "minitest"

Minitest.load :rg
Minitest::RedGreenIO.rg! color: $stdout.tty?
