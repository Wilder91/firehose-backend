class CreateNeighborhoods < ActiveRecord::Migration[7.0]
  def change
    create_table :neighborhoods do |t|

      t.timestamps
    end
  end
end
