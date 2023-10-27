class CreatePermits < ActiveRecord::Migration[7.0]
  def change
    create_table :permits do |t|
      t.string :address 
      t.string :description 
      t.string :neighborhood
      t.string :issued_date
      t.string :case_number
      t.timestamps
    end
  end
end
