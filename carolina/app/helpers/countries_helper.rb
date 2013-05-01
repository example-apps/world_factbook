module CountriesHelper

	def display_final_value(value)
		if value.class == Array
			str = ''
			value.each do |val|
				str += val.gsub('cid-cia-', '')
				str += ', ' unless val == value.last
			end
		else 
			str = value
		end
		str
	end
end