require 'spec_helper'
require_relative '../lib/country_query/runner'

module CountryQuery
  describe Runner do
    it { should respond_to(:run)}
    context 'When initialized' do
      its(:data) { should_not be_nil }
      its(:options) { should_not be_nil }
    end
  end
end
