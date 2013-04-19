module XmlParser
  class Convert
    attr_reader :xml_parsed

    def initialize(file)
      file = File.expand_path('.', "lib/test_files/#{file}")
      @xml_parsed = XmlSimple.xml_in(File.read(file))
    end

  end
end
