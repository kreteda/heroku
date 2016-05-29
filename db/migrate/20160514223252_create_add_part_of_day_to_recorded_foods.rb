class CreateAddPartOfDayToRecordedFoods < ActiveRecord::Migration
  def change
    add_column :recorded_foods, :part_of_day, :string 
  end
end
