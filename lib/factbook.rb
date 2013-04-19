class Factbook
  attr_accessor :continents, :countries
  def initialize
    xml_obj = XmlParser::Convert.new('cia-1996.xml') #file in lib/test_files/
    @xml_parsed = xml_obj.xml_parsed
    @continents = create_continents
    @countries = create_countries
    tie_countries_to_continents
  end

  def create_continents
    @xml_parsed['continent'].inject([]) {|new_arr, conts| new_arr << Continent.new(conts); new_arr}
  end

  def create_countries
    @xml_parsed['country'].inject([]) {|new_arr, countries| new_arr << Country.new(countries); new_arr}
  end

  def tie_countries_to_continents
    @countries.each do |country|
      continent_name = country.data['continent']
      continent = @continents.select{|c| c.name == continent_name}.last
      country.continent = continent
      continent.add_country(country) unless continent.has_country?(country)
    end
  end

  def most_populated_country
    country = sort_data_for(@countries, 'population').first
    puts "Most Populated Country: #{country.name} with a population of #{country.population}"
  end

  def most_inflated_countries
    inflated_countries = sort_data_for(@countries, 'inflation')[0..4]
    inflated_countries.each {|c| puts "Name: #{c.name}, Inflation Rate: #{c.inflation}"}
  end

  def continents_with_countries
    puts 'Continents:'
    @continents.each do |continent|
      puts "Continent: #{continent.name}"
      puts 'Countries:'
      sort_data_for(continent.countries, 'name').each do |country|
        puts country.name
      end
      puts '============================'
    end
  end

  private

  def sort_data_for(collection, key_name)
    collection.sort {|a, b| b.send(key_name).to_i <=> a.send(key_name).to_i}
  end

end
