class Country < ActiveRecord::Base
  attr_accessible :capital, :continent, :datacode, :gdp_agri, :gdp_ind, :gdp_serv, :government, :indep_date, :infant_mortality, :inflation, :name, :population, :population_growth, :total_area
end
