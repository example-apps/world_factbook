require 'spec_helper'

describe Country do
	it "counts number of countries in file" do
		countries = Country.all
		countries.count.should_not == 0
	end

  it "gets first country in file" do
    Country.first.name.length should be < 0
  end 
end
