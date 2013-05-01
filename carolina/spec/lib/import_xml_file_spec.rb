require 'spec_helper'
require "#{Rails.root}/lib/import_xml_file"

describe ImportXmlFile do
	it "parses xml file" do
		parse_file = ImportXmlFile.new
		parse_file.class.should equal('ImportXmlFile')
		
	end

  it "gets first country in file" do
    Country.first.name.length should be < 0
  end 
end