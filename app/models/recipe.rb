class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :preparation_time, presence: true
  validates :cook_time, presence: true
  validates :description, presence: true

  belongs_to :user, foreign_key: 'user_id', class_name: 'User'
  has_many :recipe_foods, foreign_key: 'recipe_id'
end
