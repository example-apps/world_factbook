require 'pry'
require "nokogiri"

require_relative 'parse_data'
require_relative 'query'

module Factbook
  class Main
    attr_accessor :data
    def initialize
      parser = ParseData.new
      @data = parser.data
      @query = Query.new(@data)
    end

    def run
      quit = false

      puts "Lets start:"
      while quit == false
        # display questions
        @query.questions.each_with_index do |q,i|
          puts "#{i+1}. #{q[0]}"
        end

        choice = gets.chomp
        output = input(choice)
        puts "\n"
        if output == 'quit'
          quit = true
          puts 'we are done here'
        else
          puts output
          puts "\n"
        end
      end
    end

    def input(choice = '')
      output = ""
      output += @query.option(choice)
      output
    end
  end
end
