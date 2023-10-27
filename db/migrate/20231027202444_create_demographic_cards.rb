class CreateDemographicCards < ActiveRecord::Migration[7.0]
  def change
    create_table :demographic_cards do |t|

      t.timestamps
    end
  end
end
