class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :birth_year
      t.string :height
      t.string :gender
      t.string :url
      t.references :species, null: false, foreign_key: true

      t.timestamps
    end
  end
end
