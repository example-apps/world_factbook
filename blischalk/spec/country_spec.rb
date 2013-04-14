require 'spec_helper'
require_relative '../lib/country_query/country'

module CountryQuery
  describe Country do
    subject { Country.new({name: 'Test', population: 100, inflation: 1.6}) } 
    it { should respond_to(:population) }
    it { should respond_to(:name) }
    it { should respond_to(:inflation) }
  end
end
