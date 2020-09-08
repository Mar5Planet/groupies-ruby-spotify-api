class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.string :image_url
      t.string :external_link

      t.timestamps
    end
  end
end
