require 'spec_helper'

module WorldFactbook
  describe Country do
    let(:country) { {continent: 'Asia', name: 'China', total_area: 25.5, population: 23,
    population_growth: 2.5, infant_mortality: 3.2, inflation: 1.2, government: 'gov', capital: 'Tokyo'} }
    it 'is defined' do
    end

    it '#convert_floats converts floats to integers' do
      expect(Country.convert_floats(12.5)).to eql(1250)
    end

    context '#create_country' do
      let(:created_country) { Country.create_country(country) }

      it 'creates WorldFactbook::Country object' do
        expect(created_country).to be_an_instance_of WorldFactbook::Country
      end
      it 'WorldFactbook::Country is a Struct' do
        country_is_struct = created_country.class.ancestors.include?(Struct)
        expect(country_is_struct).to be true
      end
    end
  end
end
