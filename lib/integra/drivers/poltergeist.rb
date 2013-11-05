require 'capybara/poltergeist'

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, {
    :timeout => 35, # seconds to communicate with phantomjs
    :phantomjs_logger => Logger.new('tmp/console.log'),
    :phantomjs_options => [
      '--load-images=no', '--ignore-ssl-errors=yes', '--local-to-remote-url-access=yes'
    ],
    #:debug => true,
    :window_size => [1280, 1024]
  })
end
