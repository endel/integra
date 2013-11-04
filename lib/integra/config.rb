require 'json'

module Integra
  module Config
    def self.load!
      if File.exists?(File.expand_path('./.integra'))
        #JSON.parse
      end
    end
  end
end
