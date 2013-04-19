class Continent
  attr :countries
  attr_accessor :name

  def initialize(params_hash)
    @name = params_hash['name']
    @countries = []
  end

  def add_country(country)
    @countries << country
  end

  def has_country?(country)
    @countries.include? country
  end

end