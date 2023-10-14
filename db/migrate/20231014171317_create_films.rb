class CreateFilms < ActiveRecord::Migration[7.0]
  def change
    create_table :films do |t|
      t.string :opening_crawl
      t.string :release_date
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
