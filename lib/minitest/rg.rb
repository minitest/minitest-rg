require "minitest/unit"

module MiniTest
  class RG
    VERSION = "1.0.0"

    COLORS = {
      '.' => "\e[32m.\e[0m",
      'E' => "\e[33mE\e[0m",
      'F' => "\e[31mF\e[0m",
      'S' => "\e[36mS\e[0m",
    }

    attr_reader :io, :colors

    def initialize io, colors = COLORS
      @io     = io
      @colors = colors
    end

    def print o
      io.print(colors[o] || o)
    end

    def method_missing msg, *args
      return super unless io.respond_to? msg
      io.send(msg, *args)
    end
  end
end

MiniTest::Unit.output = MiniTest::RG.new(MiniTest::Unit.output)
