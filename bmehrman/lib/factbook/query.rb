module Factbook
  class Query
    
    attr_accessor :data

    def initialize(data)
      @data = data
    end

    def questions
      [['What is the population of the country with the most people?', 'largest_population'],
        ['What are the five countries with the highest inflation rates?', 'highest_inflation'],
        ['What are the six continents in the file and which countries belong to which continent?', 'continents_with_countries'],
        ['Quit', 'exit']]
    end

    def option(input='')
      if input == 'quit' || input == 'q' || input.to_i == questions.size
        return 'quit'
      elsif input.to_i > 0 && input.to_i < questions.size
        return send(questions[input.to_i-1][1])
      else
        return "Invalid Response"
      end
    end

    def largest_population
      population_sizes = @data.values.collect(&:countries).flatten.sort{|a,b| a.population.to_i <=> b.population.to_i}.reverse

      return "#{population_sizes.first.name} is the largest, with a population of #{population_sizes.first.population} people."
    end

    def highest_inflation
      # get country with the larget population
      inflation_rates = @data.values.collect(&:countries).flatten.sort{|a,b| a.inflation.to_i <=> b.inflation.to_i}.reverse

      out = "These are the countries with the highest inflation rate:\n"

      inflation_rates[0..4].each_with_index do |country,i|
        out += "#{i+1}) #{country.name} with an inflation rate of #{country.inflation}.\n"
      end

      return out
    end

    def continents_with_countries
      out = ""

      @data.values.sort{|a,b| a.name <=> b.name}.each do |continent|
        out += continent.name
        out += "\n"
        continent.countries.each do |country|
          out += " -#{country.name}"
          out += "\n"
        end
        out += "\n"
      end
      return out
    end
  end
end