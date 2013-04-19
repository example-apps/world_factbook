class Country
  attr_accessor :name, :population, :inflation, :continent, :data

  def initialize(params_hash)
    @data       = params_hash
    @name       = params_hash['name']
    @population = params_hash['population']
    @inflation  = params_hash['inflation']
  end

end