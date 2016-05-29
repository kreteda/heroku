class Food < ActiveRecord::Base
  NUTRIENT_FACTS_PRECISION = 5

  has_many :recorded_foods, dependent: :destroy

  validates :name,
            :carbs,
            :fat,
            :protein,
            :sodium,
            :sugar, presence: true

  validates :carbs,
            :fat,
            :protein,
            :sodium,
            :sugar, numericality: {
              greater_than_or_equal_to: BigDecimal.new(0.0, 
                                                       Food::NUTRIENT_FACTS_PRECISION),
            }

  validate :carbs_exceed_sugars

  def carbs_exceed_sugars
    if carbs < sugar
      errors.add(:sugar, "can't exceed carbs (all sugars are carbohydrates)")
    end
  end

  def calories
    CaloriesCalculator.new.calculate(carbs, fat, protein)
  end
end
