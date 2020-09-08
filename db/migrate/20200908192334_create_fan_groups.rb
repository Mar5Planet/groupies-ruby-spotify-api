class CreateFanGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :fan_groups do |t|
      t.belongs_to :group, null: false, foreign_key: true
      t.belongs_to :fan, null: false, foreign_key: true
    end
  end
end
