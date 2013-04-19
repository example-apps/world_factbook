require 'spec_helper'

module WorldFactbook
  describe Tools do
    it 'is defined' do
    end
    context '#new' do
      it 'returns true' do
        tool = WorldFactbook::Tools.new
        binding.pry
        expect(tool.run).to be true
      end
    end
  end
end
