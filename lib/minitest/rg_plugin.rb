# frozen_string_literal: true

require "minitest"
require "minitest/rg_version"

# Public: Minitest plugin extension for colored test output.
#
# This module is extended by Minitest to provide the --rg command line option
# and initialize the RedGreenIO wrapper when enabled.
module Minitest
  # Internal: Register command line options for the rg plugin.
  #
  # This method is called by Minitest during option parsing to register
  # the --rg and --no-rg flags.
  #
  # opts     - The OptionParser instance for registering options.
  # _options - The Hash of parsed options (unused).
  #
  # Examples
  #
  #   # Enable via command line:
  #   ruby test/test_example.rb --rg
  #
  #   # Disable explicitly:
  #   ruby test/test_example.rb --no-rg
  #
  # Returns nothing.
  def self.plugin_rg_options opts, _options # :nodoc:
    opts.on "--[no-]rg", "Add red/green to test output." do |bool|
      RedGreenIO.rg! color: bool
    end
  end

  # Internal: Initialize the rg plugin after options are parsed.
  #
  # This method is called by Minitest after command line options have been
  # parsed. If colored output is enabled, it wraps the reporter IO objects
  # with the RedGreenIO colorizer.
  #
  # options - The Hash of parsed options containing:
  #           :io - The IO object used for test output.
  #
  # Returns nothing.
  def self.plugin_rg_init options # :nodoc:
    return unless RedGreenIO.rg?

    io = RedGreenIO.new options[:io]

    reporter.reporters.grep(Minitest::Reporter).each { |rep| rep.io = io }
  end

  # Public: IO wrapper that adds ANSI color codes to Minitest output.
  #
  # Wraps an IO object and intercepts print/puts calls to colorize test
  # result characters (. for pass, F for failure, E for error, S for skip)
  # and the final summary line.
  class RedGreenIO
    # Public: Hash mapping result characters to ANSI-colorized equivalents.
    # Keys are "." (green), "E" (yellow), "F" (red), and "S" (cyan).
    COLORS = {
      "." => "\e[32m.\e[0m",
      "E" => "\e[33mE\e[0m",
      "F" => "\e[31mF\e[0m",
      "S" => "\e[36mS\e[0m"
    }.freeze

    # Public: Returns the IO object being wrapped.
    attr_reader :io

    # Public: Returns the Hash of color mappings.
    attr_reader :colors

    # Public: Enable or disable colored output globally.
    #
    # color - The Boolean indicating whether to enable colors (default: true).
    #
    # Returns nothing.
    def self.rg! color: true
      @rg = color
    end

    # Public: Check if colored output is enabled.
    #
    # Returns true if colors are enabled, false otherwise.
    def self.rg?
      @rg ||= false
    end

    # Public: Create a new RedGreenIO wrapper around an IO object.
    #
    # io     - The IO object to wrap (typically $stdout).
    # colors - The Hash mapping result characters to colorized Strings
    #          (default: COLORS).
    #
    # Examples
    #
    #   rg = Minitest::RedGreenIO.new($stdout)
    #   rg = Minitest::RedGreenIO.new($stdout, { "." => "\e[34m.\e[0m" })
    def initialize io, colors = COLORS
      @io     = io
      @colors = colors
    end

    # Public: Print output with colorized result characters.
    #
    # Colorizes known result characters (., E, F, S) and passes through all
    # other output unchanged.
    #
    # output - The String to print.
    #
    # Returns nothing.
    def print output
      io.print(colors[output] || output)
    end

    # Public: Print a line of output, colorizing the summary line.
    #
    # Colorizes the final summary line red if there are failures or errors,
    # green if all tests passed. All other lines are passed through unchanged.
    #
    # output - The String to print, or nil to print a blank line (default: nil).
    #
    # Returns nothing.
    def puts output = nil
      return io.puts if output.nil?

      if output =~ /(\d+) failures, (\d+) errors/
        if Regexp.last_match[1] != "0" || Regexp.last_match[2] != "0"
          io.puts "\e[31m#{output}\e[0m"
        else
          io.puts "\e[32m#{output}\e[0m"
        end
      else
        io.puts output
      end
    end

    # Internal: Delegate unknown methods to the wrapped IO object.
    #
    # msg - The Symbol method name.
    # *   - Any arguments passed to the method.
    #
    # Returns the result of calling the method on the wrapped IO.
    # Raises NoMethodError if the IO doesn't respond to the method.
    def method_missing(msg, *) # :nodoc:
      return io.send(msg, *) if io.respond_to? msg

      super
    end

    # Internal: Check if the wrapped IO responds to a method.
    #
    # method_name - The Symbol method name to check.
    # include_all - The Boolean to include private methods (default: false).
    #
    # Returns true if this object or the wrapped IO responds to the method.
    def respond_to_missing? method_name, include_all = false # :nodoc:
      return true if io.respond_to? method_name, include_all

      super
    end
  end
end
