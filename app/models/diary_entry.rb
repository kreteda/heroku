class DiaryEntry < ActiveRecord::Base
  validates :date, :user, presence: true
  belongs_to :user

  has_many :recorded_foods, dependent: :destroy

  def night_foods
    recorded_foods.preload(:food).where('part_of_day = ?', 'night').map do |food_record|
      food_record.food
    end
  end

  def afternoon_foods
    recorded_foods.preload(:food).where('part_of_day = ?', 'afternoon').map do |food_record|
      food_record.food
    end
  end

  def morning_foods
    recorded_foods.preload(:food).where('part_of_day = ?', 'morning').map do |food_record|
      food_record.food
    end
  end

  def total_calories
    all_foods.sum(&:calories)
  end

  def carbs
    all_foods.sum(&:carbs)
  end

  def fat
    all_foods.sum(&:fat)
  end

  def protein
    all_foods.sum(&:protein)
  end

  def sodium
    all_foods.sum(&:sodium)
  end

  def sugar
    all_foods.sum(&:sugar)
  end

  private
  def all_foods
    morning_foods + afternoon_foods + night_foods
  end
end
