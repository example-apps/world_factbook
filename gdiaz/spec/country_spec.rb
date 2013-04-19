require 'spec_helper'

describe Country do
  before(:all) do
    @params_hash = {'name' => 'China', 'population' => '1210004956', 'inflation'=> '22.2'}
    @country = Country.new(@params_hash)
  end

  it 'should set correct name attr' do
    @country.name.should eq('China')
  end

  it 'should set correct population attr' do
    @country.population.should eq('1210004956')
  end

  it 'should set correct inflation attr' do
    @country.inflation.should eq('22.2')
  end

  it 'should set a data attr' do
    @country.data.should eq(@params_hash)
  end
end