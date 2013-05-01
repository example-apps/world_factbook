require 'xml/libxml'

module ImportFile
  class ImportXmlFile

  	class << self
  	  def run
  		  new
  	  end
  	end

  	def initialize
  	  @parsed_file = XML::Parser.file("#{Rails.root}/public/cia-1996-small.xml").parse
  	  return {@parsed_file.root.name.to_s => xml_node_to_hash(@parsed_file.root)}
  	end

	  def xml_node_to_hash(node) 
      # If we are at the root of the document, start the hash 
      if node.element? 
        puts "#{node.inspect}\n\n"
        if node.children? 
          result_hash = {} 

          node.each_child do |child| 
            result = xml_node_to_hash(child) 
            puts "#{child.name}\n\n"
            if child.name == "text"
              if !child.next? and !child.prev?
                return result
              end
            elsif result_hash[child.name.to_sym]
              if result_hash[child.name.to_sym].is_a?(Object::Array)
                result_hash[child.name.to_sym] << result
              else
                result_hash[child.name.to_sym] = [result_hash[child.name.to_sym]] << result
              end
            else 
              result_hash[child.name.to_sym] = result
            end
          end
          return result_hash 
        else 
          return nil 
        end 
      else 
        return node.content.to_s 
      end 
    end          
  end
end