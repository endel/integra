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

      # Sample feature
      FileUtils.cp(Integra.gem_libdir + "/template/i18n/sample.#{Integra.lang}.feature", File.expand_path('./features/sample.feature'))
      Integra.logger.action('create', './features/sample.feature')

      support_dest = './features/support/'
      Dir.glob(Integra.gem_libdir + "/template/features/support/*.rb").each do |source|
        FileUtils.cp(source, File.expand_path(support_dest))
        Integra.logger.action('create', "#{support_dest}#{File.basename(source)}")
      end
    end

  end
end
