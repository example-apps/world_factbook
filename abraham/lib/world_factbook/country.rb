module WorldFactbook
  class Country < Struct.new(:continent, :name, :total_area, :population,
    :population_growth, :infant_mortality, :inflation, :government, :capital)

    class << self
      def create_countries
        countries = []
        DOCUMENT.css('country').each { |country| countries << create_country(country) }
        countries
      end

      def create_country(country)
        create_variables(country)

        Country.new(@continent, @name, @total_area, @population,
          @population_growth, @infant_mortality, @inflation, @government, @capital
          )
      end

      def create_variables(country)
        Country.members.each do |member|
          instance_variable_set("@#{member}", convert_floats(country[member]))
        end
      end

      def convert_floats(value)
        if value.to_f == 0
          value
        else
          (value.to_f * 100).to_i
        end
      end
    end
  end
end

