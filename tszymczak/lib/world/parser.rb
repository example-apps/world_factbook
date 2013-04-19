class Parser

  def initialize
    @file = File.read( File.dirname(__FILE__) + '/../../data/cia-1996.xml')
  end

  def countries
    parsed['cia']['country'].map { |country| Country.new(country) }
  end

private

  def parsed
    parser = Nori.new
    parser.parse(@file)
  end

end
