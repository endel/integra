require 'ostruct'

module Integra
  class Config < OpenStruct
    def initialize(options)
      configs = {}

      configs[:driver] = (options[:driver] || 'poltergeist').to_sym
      configs[:lang] = (options[:lang] || 'en').to_sym
      configs[:app_host] = options[:app_host] || 'http://localhost'
      configs[:project_name] = options[:project_name] || File.basename(File.expand_path('.'))

      super(configs)
    end
  end
end
