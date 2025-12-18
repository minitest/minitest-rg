# frozen_string_literal: true

require "bundler/setup"

$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/../lib"

require "minitest/autorun"
require "minitest/rg"

class TestRG < Minitest::Test
  def test_pass_is_green
    output = capture_output "pass"

    assert_match "\e[32m.\e[0m",
                 output,
                 "Passing tests are GREEN"
    assert_match "\e[32m1 runs, 1 assertions, 0 failures, 0 errors, 0 skips\e[0m",
                 output,
                 "Passing summary is GREEN"
  end

  def test_fail_is_red
    output = capture_output "fail"

    assert_match "\e[31mF\e[0m",
                 output,
                 "Failing tests are RED"
    assert_match "\e[31m1 runs, 1 assertions, 1 failures, 0 errors, 0 skips\e[0m",
                 output,
                 "Failing summary is RED"
  end

  def test_error_is_yellow
    output = capture_output "error"

    assert_match "\e[33mE\e[0m",
                 output,
                 "Erroring tests are YELLOW"
    assert_match "\e[31m1 runs, 0 assertions, 0 failures, 1 errors, 0 skips\e[0m",
                 output,
                 "Erroring summary is RED"
  end

  def test_skip_is_cyan
    output = capture_output "skip"

    assert_match "\e[36mS\e[0m",
                 output,
                 "Skipped tests are CYAN"
    assert_match "\e[32m1 runs, 0 assertions, 0 failures, 0 errors, 1 skips\r\n" \
                 "\r\nYou have skipped tests. Run with --verbose for details.\e[0m",
                 output,
                 "Skipped summary is GREEN"
  end

  def test_no_colors_via_option
    output = capture_output "no_color"
    assert_includes output, "\n1 runs"
  end

  def test_force_colors_via_option
    output = capture_output "color", tty: false
    assert_includes output, "\n\e[32m1 runs"
  end

  def test_no_color_without_tty
    output = capture_output "pass", tty: false
    assert_includes output, "\n1 runs"
  end

  def capture_output command, tty: true
    if tty
      os = `uname -s`.chomp
      if os.include?("BSD") || os.include?("Darwin")
        `script -q /dev/null ./scripts/run_#{command}`
      else
        `script -q -c ./scripts/run_#{command} /dev/null`
      end
    else
      `scripts/run_#{command} </dev/null`
    end
  end
end
