class Country
  attr_reader :name, :population, :inflation, :continent

  def initialize(args={})
    @name = args['@name']
    @population = args['@population'].to_i
    @inflation = args['@inflation'].to_i
    @continent = args['@continent']
  end

end
