module Integra
  module Commands

    def self.run(options)
      require 'integra/autorun'
    end

    def self.init(options)
      require 'fileutils'

      # Create '.integra' file.
      File.open(File.expand_path('./.integra'), 'w+') do |f|
        data = open("#{Integra.gem_libdir}/template/integra_init").read
        data.gsub!('{lang}', Integra.lang.to_s)
        f.write(data)
      end

      # Create 'features' and 'support' directories
      FileUtils.mkdir_p(File.expand_path('./features/support/'))
      FileUtils.cp_r(Dir.glob(Integra.gem_libdir + "/template/features/support/*.rb"), File.expand_path('./features/support/'))
    end

  end
end
