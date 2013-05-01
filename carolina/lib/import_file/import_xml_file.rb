require 'nokogiri'

module ImportFile
  class ImportXmlFile

  	def run
  		@parsed_file = Nokogiri::XML(File.open("#{Rails.root}/public/cia-1996.xml"))
  	end

  end
end