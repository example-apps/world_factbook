require 'spec_helper'

describe Factbook do
  before(:all) do
    @factbook = Factbook.new
  end

  it 'should have continents' do
    @factbook.continents.should_not be_empty
  end

  it 'should have countries' do
    @factbook.countries.should_not be_empty
  end

  it 'should have continents having countries' do
    @factbook.continents.first.countries.should_not be_empty
  end

  it 'should have countries whose parent is a continent' do
    @factbook.countries.first.continent.should_not be(nil)
  end
end