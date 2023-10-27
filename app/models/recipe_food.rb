class RecipeFood < ApplicationRecord
  belongs_to :recipe, foreign_key: 'recipe_id', class_name: 'Recipe'
  belongs_to :food, foreign_key: 'food_id', class_name: 'Food'

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
