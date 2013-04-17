require 'spec_helper'
require_relative '../lib/country_query/continent'

module CountryQuery
  describe Continent do
    subject { Continent.new('BrettLand', 'BrettLand') } 
    it { should respond_to(:id) }
    it { should respond_to(:name) }
    it { should respond_to(:countries) }
  end
end
