class CreateRecordedFoods < ActiveRecord::Migration
  def change
    create_table :recorded_foods do |t|
      t.references :food, index: true, foreign_key: true
      t.references :diary_entry, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
