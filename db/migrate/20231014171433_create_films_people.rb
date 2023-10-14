class CreateFilmsPeople < ActiveRecord::Migration[7.0]
  def change
    create_table :films_people do |t|
      t.references :film, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
    add_index :films_people, %i[film_id person_id]
  end
end
