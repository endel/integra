module Integra
  module Commands

    def self.run(options)
      require 'integra/autorun'
    end

    def self.init(options)
      require 'fileutils'

      # Create '.integra' file.
      ['integra', 'rspec'].each do |file|
        File.open(File.expand_path("./.#{file}"), 'w+') do |f|
          data = open("#{Integra.gem_libdir}/template/#{file}").read
          data.gsub!('{lang}', Integra.config.lang.to_s)
          f.write(data)
        end
        Integra.logger.action('create', "./.#{file}")
      end

      # Create 'features' and 'support' directories
      FileUtils.mkdir_p(File.expand_path('./features/support/'))

      # Sample feature
      FileUtils.cp(Integra.gem_libdir + "/template/i18n/sample.#{Integra.config.lang}.feature", File.expand_path('./features/sample.feature'))
      Integra.logger.action('create', './features/sample.feature')

      support_dest = './features/support/'
      Dir.glob(Integra.gem_libdir + "/template/features/support/*.rb").each do |source|
        FileUtils.cp(source, File.expand_path(support_dest))
        Integra.logger.action('create', "#{support_dest}#{File.basename(source)}")
      end
    end

  end
end
