require "nokogiri"
require_relative "continent"
require_relative "country"
module CountryQuery
  class Data
    DEFAULT_FILEPATH = File.expand_path('../../../data_files',__FILE__)
    attr_accessor :stats, :queries

    def initialize
      @stats = statistics 
    end

    def query(selection)
      send(queries[selection-1][:answer])
    end

    def queries
      [{
        question: 'What is the population of the country with the most people?',
        answer: :highest_population},
      {question: 'What are the five countries with the highest inflation rates, and what were those rates in 1996?',
      answer: :highest_inflation_rates},
      {question: 'What are the six continents in the file and which countries belong to which continent?',
       answer: :continents_and_countries},
      {question: 'Quit',
       answer: :quit}
      ]
    end

    private

    def statistics
      @doc = Nokogiri::XML(File.open(DEFAULT_FILEPATH + "/cia-1996.xml"))
      continents = []
      xml_continents = @doc.xpath("//continent")
      xml_countries = @doc.xpath("//country")
      xml_continents.each do |c|
        continents << Continent.new(c.attr("id"), c.attr("name")) 
      end
      xml_countries.each do |country|
        continent = continents.select { |c| c.name == country.attr("continent") }.first
        continent.add_country(Country.new(name: country.attr("name"), population: country.attr("population"), inflation: country.attr("inflation")))
      end
      continents
    end

    def highest_population
      puts @stats.map(&:countries).flatten.sort_by{|country| country.population.to_i }.last.name + " has the world's highest population at: " + @stats.map(&:countries).flatten.sort_by{|country| country.population.to_i }.last.population
    end

    def highest_inflation_rates
      countries = @stats.map(&:countries).flatten.sort_by{|country| country.inflation.to_i }.reverse
      countries.each_with_index do |c, i|
        if i <= 4
          puts c.name + ': has one of the highest inflation rates at ' + c.inflation
        else
          break
        end
      end
    end

    def continents_and_countries
      continents = @stats.sort_by{|c| c.name }
      continents.each do |c|
        puts c.name
        countries = c.countries.sort_by{|c| c.name}
        countries.each do |c|
          puts '--' + c.name
        end
        puts "\n"
      end
      return
    end
  end
end
