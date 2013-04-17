module CountryQuery
  class Country
    attr_reader :name, :population, :inflation
    def initialize(attrs = {name: '', population: nil, inflation: nil})
      @name = attrs[:name]
      @population = attrs[:population]
      @inflation = attrs[:inflation]
    end
  end
end
