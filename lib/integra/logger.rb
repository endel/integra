require 'logger'
require 'colorize'

module Integra
  class Logger
    def initialize
      @logger = ::Logger.new(STDOUT)
      @logger.formatter = proc do |severity, datetime, progname, msg|
        "#{msg}\n"
      end
    end

    def action(name, description)
      @logger.info("#{name.green}\t#{description}")
    end

  end
end
