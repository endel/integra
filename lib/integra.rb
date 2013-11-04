require "integra/version"

module Integra
  autoload :Commands, 'integra/commands'
  autoload :Config,   'integra/config'

  def self.command!(options={})
    Config.load!

    self.lang=options[:lang] if options[:lang]

    Commands.send(options[:command], options)
  end

  def self.lang
    @lang || :en
  end

  def self.lang=(lang)
    @lang = lang
  end

  # Return a directory with the project libraries.
  def self.gem_libdir
    t = ["#{File.dirname(File.expand_path($0))}/../lib/#{Integra::NAME}",
         "#{Gem.dir}/gems/#{Integra::NAME}-#{Integra::VERSION}/lib/#{Integra::NAME}"]
    t.each {|i| return i if File.readable?(i) }
    raise "both paths are invalid: #{t}"
  end

end
