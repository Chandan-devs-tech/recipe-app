class Recipe < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :ingredients
  has_many :foods, through: :ingredients
  accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: :all_blank

  validates :name, :preparation_time, :cooking_time, presence: true
  validates :preparation_time, :cooking_time, numericality: { only_integer: true }
end
