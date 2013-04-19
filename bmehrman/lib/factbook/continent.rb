module Factbook
  class Continent
    attr_accessor :id,:name,:countries
    def initialize(id, name, countries = [])
      @id        = id
      @name      = name
      @countries = countries
    end
  end
end
