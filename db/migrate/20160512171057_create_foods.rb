class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      decimal_zero = BigDecimal.new(0.0, Food::NUTRIENT_FACTS_PRECISION)

      t.string :name, null: false
      t.decimal :carbs, default: decimal_zero, null: false
      t.decimal :fat, default: decimal_zero, null: false
      t.decimal :protein, default: decimal_zero, null: false
      t.decimal :sodium, default: decimal_zero, null: false
      t.decimal :sugar, default: decimal_zero, null: false

      t.timestamps null: false
    end
  end
end
