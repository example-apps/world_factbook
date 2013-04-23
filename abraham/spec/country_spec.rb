require 'spec_helper'

module WorldFactbook
  describe Country do
    it 'is defined' do
    end

    it '#convert_floats converts floats to integers' do
      expect(Country.convert_floats(12.5)).to eql(1250)
    end
  end
end
