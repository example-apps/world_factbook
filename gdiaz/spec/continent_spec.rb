require 'spec_helper'

describe Continent do
  before(:all) do
    @cont_params_hash = {'name' => 'Asia'}
    @country_params_hash = {'name' => 'China', 'population' => '1210004956', 'inflation'=> '22.2'}
    @continent = Continent.new(@cont_params_hash)
    @country = Country.new(@country_params_hash)
  end

  it 'should set name attr' do
    @continent.name.should eq('Asia')
  end

  it 'should add a country' do
    @continent.add_country(@country)
    @continent.countries.should include(@country)
  end

  it 'should check continent has country' do
    @continent.has_country?(@country).should be(true)
  end

end