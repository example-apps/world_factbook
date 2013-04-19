module WorldFactbook
  class << self
    def get_data
      @countries ||= Country.create_countries
    end

    def convert_data(match, fact)
      (match.send(fact).to_f / 100)
    end

    def print_result(matches, fact)
      matches.each do |m|
        puts "#{m.name} - with #{fact.capitalize} of #{convert_data(m, fact)}"
      end
    end

    def countries_cleaned(countries, fact)
      countries.select {|c| !c.send(fact).nil? }
    end

    def method_missing(method_id, *arguments, &block)
      if [:least, :greatest].include?(method_id)
        get_data
        fact = arguments.first
        limit = arguments.last
        matches = countries_cleaned(@countries, fact).sort_by { |c| c.send(fact) }
        sorted_reults = method_id == :least ? matches.take(limit) : matches.reverse.take(limit)
        print_result(sorted_reults, fact)
        return
      else
        super
      end
    end
  end
end
