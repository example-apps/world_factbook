module CountryQuery
  class Continent
    attr_reader :id, :name, :countries
    def initialize(id, name)
      @id = id
      @name = name
      @countries = []
    end

    def add_country(country)
      @countries << country
    end
  end
end
