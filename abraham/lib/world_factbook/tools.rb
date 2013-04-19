module WorldFactbook
  class << self
    # def greatest(fact, limit=1)
    #   get_data
    #   matches = countries_cleaned(@countries, fact).sort_by { |c| c.send(fact) }.reverse.take(limit)
    #   print_result(matches, fact)
    #   return
    # end

    # def least(fact, limit=1)
    #   get_data
    #   matches = countries_cleaned(@countries, fact).sort_by { |c| c.send(fact) }.take(limit)
    #   print_result(matches, fact)
    #   return
    # end

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


  # max_pop = doc.css("country").collect {|c| c['population'].to_i}.max
  # doc.search("country[population='#{max_pop}']")

  # inflation = doc.search('country').sort {|lt, gt| gt['inflation'].to_i <=> lt['inflation'].to_i }
  # inflation.take(5).collect {|c| c['name'] + c['inflation']}
  # hash = {}
  # continents = doc.css('continent').map {|c| hash[c['name']] = []}
  # doc.search('country').each {|c| hash[c['continent']] << c['name']}
