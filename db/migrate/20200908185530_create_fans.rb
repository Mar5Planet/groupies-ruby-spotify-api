class CreateFans < ActiveRecord::Migration[6.0]
  def change
    create_table :fans do |t|
      t.string :name
      t.string :location
      t.string :profile_image_url

      t.timestamps
    end
  end
end
