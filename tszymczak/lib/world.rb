unless $LOAD_PATH.include?( File.dirname(__FILE__) )
  $LOAD_PATH.unshift File.dirname(__FILE__)
end

require 'world/parser'
require 'world/country'
require 'pry'
require 'nori'
require 'nokogiri'
