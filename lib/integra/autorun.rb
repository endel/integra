require 'integra'
require 'rspec/autorun'

require 'logger'
require 'rspec'
require 'rspec/expectations'

require File.expand_path('spec/ext/gherkin')

require "turnip"
require "turnip/rspec"
require 'turnip/capybara'

# Load all steps
Dir.glob("spec/steps/**/*steps.rb") { |f| load f, true }

# Load all support files
Dir.glob("spec/support/**.rb") { |f| load f, true }
#end

require 'capybara'
require 'capybara/rspec'
require 'capybara/webkit'

ENV['DRIVER'] = ENV['DRIVER'] || 'poltergeist'
JS_STDOUT = Logger.new('tmp/console.log')

#
# Take screenshots on every step
#
require 'gnawrnip'
Gnawrnip.ready!
Gnawrnip.configure do |c|
  c.publisher_driver = :js
  c.make_animation   = true
  c.frame_interval   = 2000 # milliseconds
  c.frame_size       = [640, 360] # width, height
end

#
# Configure Selenium + Vagrant | Multiple browsers
# http://www.without-brains.net/blog/2012/08/01/capybara-and-selenium-with-vagrant/
#

#Capybara.app_host = "http://br.stage.recepedia.com"
#Capybara.app_host = "http://br.recepedia.com"
Capybara.app_host = "http://br.recepedia.dev"
Capybara.default_wait_time = 10
Capybara.ignore_hidden_elements = false

if ENV['DRIVER'] == 'poltergeist'
    # DEFAULT: headless tests with poltergeist/PhantomJS
    require 'capybara/poltergeist'
    Capybara.register_driver :poltergeist do |app|
        Capybara::Poltergeist::Driver.new(app, {
            :timeout => 35, # seconds to communicate with phantomjs
			:phantomjs_logger => JS_STDOUT,
            :phantomjs_options => [
                '--load-images=no', '--ignore-ssl-errors=yes', '--local-to-remote-url-access=yes'
            ],
            #:debug => true,
            :window_size => [1280, 1024]
        })
    end
    Capybara.default_driver    = :poltergeist
end

Capybara.default_driver = ENV['DRIVER'].to_sym

#
# RSpec configuration
#
RSpec.configure do |c|
  c.project_name = "Recepedia"

  c.before(:type => :feature) do
	#
	# Use Firefox as default user-agent
	#
	page.driver.add_headers({
        "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:25.0) Gecko/20100101 Firefox/25.0"
    })
  end

  c.after(:type => :feature) do |group|
	  #page.save_screenshot("./tmp/screenshots/#{example.description.downcase}-#{ENV['DRIVER']}.png")
  end

end

