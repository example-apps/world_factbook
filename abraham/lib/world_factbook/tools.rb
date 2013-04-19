module WorldFactbook
  class << self
    def get_data
      @countries ||= Country.create_countries
    end

    def convert_data(match, fact)
      (match.send(fact).to_f / 100)
    end

    def list_countries(order=:smallest)
      get_data
      grouped_countries = @countries.group_by {|c| c.continent }
      grouped_countries.each do |k , v|
        puts "In #{k} there is:"
        sorted = order == :smallest ? v.sort_by {|country| country.name } : v.sort_by {|country| country.name }.reverse
        sorted.each do |country|
          puts "--- #{country.name}"
        end
      end
      return
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
      if [:smallest, :greatest].include?(method_id)
        get_data
        fact = arguments.first
        limit = arguments.last
        matches = countries_cleaned(@countries, fact).sort_by { |c| c.send(fact) }
        sorted_reults = method_id == :smallest ? matches.take(limit) : matches.reverse.take(limit)
        print_result(sorted_reults, fact)
        return
      else
        super
      end
    end
  end
end
