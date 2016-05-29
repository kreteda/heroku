class CaloriesCalculator
  def calculate(carbs, fat, protein)
    (carbs * nutrient_to_kcal(:carbs) + 
     fat * nutrient_to_kcal(:fat) + 
     protein * nutrient_to_kcal(:protein))
  end

  def nutrient_to_kcal(nutrient) 
    {
      carbs: 4,
      protein: 4,
      fat: 9
    }[nutrient]
  end
end
