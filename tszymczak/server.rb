$:.unshift File.dirname(__FILE__)
require 'sinatra'
require 'lib/world.rb'

before do
  @data = Parser.new.countries
end

get '/' do
  @countries = @data
  erb :index
end

get '/most_people' do
  @countries = [ @data.max_by(&:population) ]
  erb :index
end

get '/highest_inflation_rates' do
  @countries = @data.sort_by(&:inflation).reverse.take 5
  erb :index
end

get '/by_continents' do
  @countries = @data.sort_by(&:continent)
  erb :index
end