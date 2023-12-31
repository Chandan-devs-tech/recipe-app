class Food < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id', class_name: 'User'
  has_many :recipe_foods, foreign_key: 'food_id'

  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, allow_float: true }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
