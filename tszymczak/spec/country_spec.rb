require 'spec_helper'

module World
  describe Country do

    let(:country) { Country.new(  name:       'Zambia',
                                  population: '9159072',
                                  inflation:   55,
                                  continent:  'Africa' ) }

    it 'Should respond to attributes' do
      country.should respond_to :name
      country.should respond_to :population
      country.should respond_to :inflation
      country.should respond_to :continent
    end

  end
end
