require 'world_factbook/tools'
require 'world_factbook/country'
require "pry"

DATA_FILE = File.expand_path('../../assets/cia-1996.xml', __FILE__)
DOCUMENT = Nokogiri::XML(File.read(DATA_FILE))


