require 'spec_helper'

module XmlParser
  describe Convert do
    it "should respond with parsed non nil xml" do
      xml_obj = XmlParser::Convert.new('cia-1996.xml')
      xml_parsed = xml_obj.xml_parsed
      xml_parsed.should_not be_nil
    end
  end
end
