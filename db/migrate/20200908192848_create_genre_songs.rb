class CreateGenreSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :genre_songs do |t|
      t.belongs_to :song, null: false, foreign_key: true
      t.belongs_to :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
