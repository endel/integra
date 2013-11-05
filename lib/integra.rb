require "integra/version"

module Integra
  autoload :Commands, 'integra/commands'
  autoload :Config,   'integra/config'
  autoload :Logger,   'integra/logger'

  module Drivers; end

  class << self
    attr_accessor :logger, :config
  end

  def self.command!(options={})
    @logger = Logger.new
    @config = Config.new(options)

    #
    # When user enters with a path or file as argument, just run it.
    #
    unless Commands.respond_to?(options[:command])
      options[:args] << options[:command]
      options[:command] = :run
    end

    Commands.send(options[:command], options)
  end

  # Return a directory with the project libraries.
  def self.gem_libdir
    t = ["#{File.dirname(File.expand_path($0))}/../lib/#{Integra::NAME}",
         "#{Gem.dir}/gems/#{Integra::NAME}-#{Integra::VERSION}/lib/#{Integra::NAME}"]
    t.each {|i| return i if File.readable?(i) }
    raise "both paths are invalid: #{t}"
  end

end
