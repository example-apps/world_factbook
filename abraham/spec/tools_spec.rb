require 'spec_helper'

module WorldFactbook
  describe self do
    let(:match) { Country.new('Asia', 'China', 255, 10025, 245,
              120, 230, 'whatever', 'Tokyo') }

    it 'is defined' do
    end

    context '#get_data' do
      it 'returns array' do
        expect(WorldFactbook.get_data).to be_an_instance_of Array
      end

      it 'returned array should be made of WorldFactbook::Country' do
        is_worldbook_countries = WorldFactbook.get_data.all? {|c| c.class == WorldFactbook::Country }
        expect(is_worldbook_countries).to be_true
      end
    end
    context '#convert_data' do
      it 'returns a value in base 10 if integer' do
        expect(WorldFactbook.convert_data(match, :inflation)).to eql(2.30)
      end
    end
  end
end
