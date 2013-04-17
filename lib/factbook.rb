require "pry"
require 'xmlsimple'
Dir['./lib/parser/*.rb'].each { |path| require path }

xml_obj = XmlParser::Convert.new('cia-1996.xml') #file in lib/test_files/
xml_parsed = xml_obj.xml_parsed

countries = xml_parsed['country'] #Pulls Countries

## Question 1
most_pop = countries.select {|s| s.has_key? 'population'}.sort {|a, b| b['population'].to_i <=> a['population'].to_i}.first
puts "Most Population Country: #{most_pop['name']} with a population of #{most_pop['population']}"

2.times {puts "#################################"}

## Question 2
inflation_countries = countries.select {|s| s.has_key? 'inflation'}.sort {|a, b| b['inflation'].to_i <=> a['inflation'].to_i}[0..4]
puts "Highest Inflation Countries:"
inflation_countries.each {|c| puts "Name: #{c['name']}, Inflation Rate: #{c['inflation']}"}

2.times {puts "#################################"}

## Question 3
continents = xml_parsed['continent']
puts "Continents:"
names = continents.collect {|continent| continent["name"]}

names.each do |name|
  #corresponding countries will be selected for continent and sorted by name
  corresponding_countries = countries.select {|c| c["continent"] == name}.sort {|a, b| a['name'] <=> b['name']}
  puts "Continent: #{name}"
  puts "Countries:"
  corresponding_countries.each{|country| puts country['name']}
  puts "==================================="
end
