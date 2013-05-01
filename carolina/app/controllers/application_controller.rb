require 'nokogiri'

class ApplicationController < ActionController::Base
  protect_from_forgery

  def parsed_file
    @parsed_file ||= ImportFile::ImportXmlFile.new.run
  end
  helper_method :parsed_file

  def available_attributes
    @available_attributes ||= get_available_attributes
  end
  helper_method :available_attributes

  def available_countries
    @available_countries ||= get_available_countries
  end
  helper_method :available_countries

  private

  	def get_available_attributes
		  available_attributes = []
		  @parsed_file.xpath("//country").each do |cntry| 
		  	cntry.attributes.each do |key, value|
		  	  available_attributes << key unless key == 'id' || key == 'name'
		  	end
		  	cntry.children.each {|child| available_attributes << child.name unless child.name == 'text'}
		  end

		  available_attributes.uniq.sort
	  end

	  def get_available_countries
		  available_countries = []
		  available_countries = @parsed_file.xpath("//country").collect {|cntry| cntry[:name]}
		  available_countries.uniq.sort
	  end

end
