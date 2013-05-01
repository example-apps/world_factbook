class CountriesController < ApplicationController

  before_filter :parsed_file

  def list_of_attributes
    @countries = available_countries
    @attrs = available_attributes
  end

  def get_attribute_data
    @countries = available_countries
    @attrs = available_attributes
    @selected_country = params[:country_value]
    @selected_attribute = params[:set_attrb]
    @final_value = find_data_for_country(@selected_country, @selected_attribute)

    render 'list_of_attributes'
  end

  private

    def find_data_for_country(cntry, attrb)
      final_value = []
      
      @parsed_file.xpath("//country").each do |node|
        if node.attr('name') == cntry
          final_value << node.attr("#{attrb}") unless node.attr("#{attrb}").nil?
          if final_value.empty?
            node.children.each do |child| 
              if child.name == attrb
                if child.attributes['name'].nil?
                  final_value << child.attributes['country'].value
                else
                  final_value << child.attributes['name'].value
                end
              end
            end
          end
          break
        end
      end

      final_value
    end

end
