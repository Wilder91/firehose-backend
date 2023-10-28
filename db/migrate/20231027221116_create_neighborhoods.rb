class CreateNeighborhoods < ActiveRecord::Migration[7.0]
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.string :population
      t.string :white
      t.string :black_AfAm
      t.string :amInd_AkNa
      t.string :asian
      t.string :natHaw_Pac
      t.string :other_Race
      t.string :twoOrMore
      t.string :isp_Lat
      t.string :housing
      t.string :occupied
      t.string :unoccupied
      t.timestamps
    end
  end
end
