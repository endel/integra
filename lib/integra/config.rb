require 'ostruct'

module Integra
  class Config < OpenStruct
    def initialize(options)
      configs = {}

      configs[:lang] = options[:lang] || :en
      configs[:project_name] = File.basename(File.expand_path('.'))

      super(configs)
    end
  end
end
