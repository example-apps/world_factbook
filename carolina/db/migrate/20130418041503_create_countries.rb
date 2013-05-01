class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :continent
      t.string :name
      t.string :datacode
      t.integer :total_area
      t.integer :population
      t.float :population_growth
      t.float :infant_mortality
      t.integer :gdp_agri
      t.float :inflation
      t.integer :gdp_ind
      t.string :capital
      t.string :government
      t.date :indep_date
      t.integer :gdp_serv

      t.timestamps
    end
  end
end
