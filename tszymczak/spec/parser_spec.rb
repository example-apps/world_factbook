require 'spec_helper'

module World
  describe Parser do

    let(:parser) { Parser.new }

    it 'Should respond to countries' do
      parser.should respond_to(:countries)
    end

    it 'Should respond with an array' do
      parser.countries.should be_an_instance_of Array
    end

  end
end
