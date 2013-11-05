# Integra

A nice set of defaults for integration tests, no matter what language your
application is written in.

## Requirements

- [ruby >= 1.9.2](http://rvm.io/)
- [phantomjs](https://github.com/ariya/phantomjs)

## Installation

Install it globally in your system:

    $ gem install integra

## How to use

Goto your project root and run the initializer:

    $ cd ~/Projects/my-nice-project/
    $ integra init localhost

For custom [gherkin](https://github.com/cucumber/gherkin) language support, use
the `--lang=` option:

    $ integra init --lang=pt

## The defaults

- [turnip](https://github.com/jnicklas/turnip/)
- [turnip_formatter](https://github.com/gongo/turnip_formatter/)
- [capybara](https://github.com/jnicklas/capybara)
- [rspec](https://github.com/rspec/rspec)
- [poltergeist](https://github.com/jonleighton/poltergeist)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
