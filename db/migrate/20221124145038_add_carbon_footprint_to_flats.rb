class AddCarbonFootprintToFlats < ActiveRecord::Migration[7.0]
  def change
    add_column :flats, :carbon_footprint, :float
  end
end
