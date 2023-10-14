class CreateSpecies < ActiveRecord::Migration[7.0]
  def change
    create_table :species do |t|
      t.string :name
      t.string :classification
      t.string :average_lifespan
      t.string :url

      t.timestamps
    end
  end
end
