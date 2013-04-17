module CountryQuery
  class OptionParser
    def self.parse(selection, options, data)
      case
      when selection.downcase == 'quit' || selection.downcase == 'q' || selection.to_i == options.size
        return 'exit'
      when (selection.to_i <= options.size && selection.to_i > 0)
        data.query(selection.to_i)
        puts "\n"
      else
        raise 'You made an invalid selection'
      end
    end
  end
end
