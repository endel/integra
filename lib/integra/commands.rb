module Integra
  module Commands
    extend self

    def run(options)
      Integra.logger.log("Running: #{Integra.config.app_host}", :green)
      require 'integra/autorun'
    end

    def init(options)
      require 'fileutils'

      if (app_host = options[:args].first)
        Integra.config.app_host = self.build_url(app_host)
      end

      # Create '.integra' file.
      ['integra', 'rspec'].each do |file|
        File.open(File.expand_path("./.#{file}"), 'w+') do |f|
          data = open("#{Integra.gem_libdir}/template/#{file}").read
          #
          # replace config variables
          #
          data.gsub!('{lang}', Integra.config.lang.to_s)
          data.gsub!('{app_host}', Integra.config.app_host.to_s)
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
        unless File.exists?(File.expand_path("#{support_dest}#{File.basename(source)}"))
          FileUtils.cp(source, File.expand_path(support_dest))
          Integra.logger.action('create', "#{support_dest}#{File.basename(source)}")
        end
      end
    end

    protected

    def build_url(url)
      url = "http://#{url}" if !url.start_with?('http')
      url
    end

  end
end
