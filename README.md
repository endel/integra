# Integra

A nice set of defaults for integration tests, no matter what language your
application is written in.

## System requirements

- [ruby >= 1.9.2](http://rvm.io/)
- [phantomjs](https://github.com/ariya/phantomjs)

## Installation

Install it globally in your system:

    $ gem install integra

## How to use

Goto your project root and run the initializer:

    $ cd ~/Projects/my-nice-project/
    $ integra init localhost

Running the tests:

    $ integra

Running the tests with a custom driver:

    $ integra --driver=selenium

For custom [gherkin](https://github.com/cucumber/gherkin) language support, use
the `--lang=` option:

    $ integra init --lang=pt

## Default toolset

- [rspec](https://github.com/rspec/rspec)
- [capybara](https://github.com/jnicklas/capybara)
- [poltergeist](https://github.com/jonleighton/poltergeist)
- [turnip](https://github.com/jnicklas/turnip/)
- [turnip_formatter](https://github.com/gongo/turnip_formatter/)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
