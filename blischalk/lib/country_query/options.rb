module CountryQuery
  class Options
    attr_accessor :data
    def initialize(data)
      @data = data 
    end

    def display
      @data.queries.each_with_index do |q, i|
        puts "#{i+1}.) " + q[:question]
      end
    end

    def size
      @data.queries.size
    end
  end
end
