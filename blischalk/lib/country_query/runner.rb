require_relative "options"
require_relative "data"
require_relative "option_parser"

module CountryQuery
  class Runner
    attr_reader :data, :options
    def initialize()
      @data = Data.new
      @options = Options.new(@data)
    end

    def run
      quit = false
      puts "Choose a question below and an answer will be provided:"
      while quit == false
        @options.display
        selection = gets.chomp
        response = OptionParser.parse(selection, @options, @data)
        if response == 'exit'
          quit = true; 
          puts "Goodbye!"
        else
          puts response
        end
      end
    end
  end
end
