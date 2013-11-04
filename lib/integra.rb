require "integra/version"

module Integra
  autoload :Commands, 'integra/commands'
  autoload :Config,   'integra/config'
  autoload :Logger,   'integra/logger'

  class << self
    attr_accessor :logger, :lang
  end

  def self.command!(options={})
    @logger = Logger.new
    @lang = options[:lang] || :en
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
