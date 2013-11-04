#
# Override default iso_code for pt support
#

module Gherkin
  module Parser
    class Parser

      # Initialize the parser. +machine_name+ refers to a state machine table.
      def initialize(formatter, raise_on_error=true, machine_name='root', force_ruby=false, iso_code=Integra.config.lang)
        puts "Lang => #{iso_code}"
        @formatter = formatter
        @listener = Listener::FormatterListener.new(@formatter)
        @raise_on_error = raise_on_error
        @machine_name = machine_name
        @machines = []
        @lexer = Gherkin::Lexer::I18nLexer.new(self, force_ruby, iso_code)
      end

    end
  end
end

