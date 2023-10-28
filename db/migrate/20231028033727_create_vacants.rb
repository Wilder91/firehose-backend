class CreateVacants < ActiveRecord::Migration[7.0]
  def change
    create_table :vacants do |t|
      t.string :address 
      t.string :neighborhood
      t.string :council_district
      t.string :typology 
      t.string :datenotice 
      t.string :datecancel 
      t.string :owner_abbr
      t.timestamps
    end
  end
end
