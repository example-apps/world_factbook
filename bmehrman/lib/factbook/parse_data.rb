require "nokogiri"
require_relative 'continent'
require_relative 'country'

module Factbook
  class ParseData
    attr_reader :data

    def initialize
      @data = import(File.join(File.expand_path('../../../public',__FILE__ ),'cia-1996.xml'))
    end

    def import(path)
      @xml = Nokogiri::XML(File.open(path))
      continents = {}

      # pull out raw xml for continents and countries
      raw_continents = @xml.xpath("//continent")
      raw_countries  = @xml.xpath("//country")

      # parse continents in objects
      raw_continents.each do |raw_c|
        continents[raw_c.attr('name')] = Continent.new raw_c.attr('id'), raw_c.attr('name')
      end

      # parse countries into the contient objects
      raw_countries.each do |raw_co|
        continent = continents[raw_co.attr('continent')]
        continent.countries << Country.new(raw_co.attr('name'), raw_co.attr('population'), raw_co.attr('inflation'))
      end
      continents
    end
  end
end