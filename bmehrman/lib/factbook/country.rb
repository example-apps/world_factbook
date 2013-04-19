module Factbook
  class Country
    attr_accessor :name, :population, :inflation
    
    def initialize(name, population, inflation)
      @name = name 
      @population = population
      @inflation = inflation
    end

  end
end
