require 'spec_helper'
require_relative '../lib/country_query/options'

module CountryQuery
  describe Options do
    subject { Options.new(mock(Data)) }
    it { should respond_to(:display)}
    it { should respond_to(:size)}
    context 'When initialized' do
      its(:data) { should_not be_nil }
      context 'with a data object containing 2 queries' do
      subject { 
        data = mock Data, :queries => [{question: "first question", answer: 'first answer'}, {question: "second question", answer: 'second answer'}]
        Options.new(data) 
      }
      its(:size)  {should eq(2) }
      end
    end
  end
end
