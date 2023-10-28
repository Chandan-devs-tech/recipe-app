require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  it 'Should allow an ingredient for a recipe with quantity , recipe_id and food_id' do
    user = User.new(name: 'Leah', email: 'leah@gmail.com', password: '123456')
    food = Food.new(name: 'Tomato', measurement_unit: 'kg', price: 5, quantity: 1, user:)
    recipe = Recipe.new(name: 'Beryani', description: 'Onion , Rice, Tomato and yougurt are needed',
                        preparation_time: 1, cook_time: 2, user:)
    ingredient = RecipeFood.new(quantity: 2, food:, recipe:)
    expect(ingredient).to be_valid
  end

  it 'Should not allow an ingredient for a recipe without quantity' do
    user = User.new(name: 'Leah', email: 'leah@gmail.com', password: '123456')
    food = Food.new(name: 'Tomato', measurement_unit: 'kg', price: 5, quantity: 1, user:)
    recipe = Recipe.new(name: 'Beryani', description: 'Onion , Rice, Tomato and yougurt are needed',
                        preparation_time: 1, cook_time: 2, user:)
    ingredient = RecipeFood.new(food:, recipe:)
    expect(ingredient).not_to be_valid
  end

  it 'Should not allow an ingredient for a recipe without food' do
    user = User.new(name: 'Leah', email: 'leah@gmail.com', password: '123456')
    Food.new(name: 'Tomato', measurement_unit: 'kg', price: 5, quantity: 1, user:)
    recipe = Recipe.new(name: 'Beryani', description: 'Onion , Rice, Tomato and yougurt are needed',
                        preparation_time: 1, cook_time: 2, user:)
    ingredient = RecipeFood.new(quantity: 2, recipe:)
    expect(ingredient).not_to be_valid
  end

  it 'Should not allow an ingredient for a recipe without recipe' do
    user = User.new(name: 'Leah', email: 'leah@gmail.com', password: '123456')
    food = Food.new(name: 'Tomato', measurement_unit: 'kg', price: 5, quantity: 1, user:)
    Recipe.new(name: 'Beryani', description: 'Onion , Rice, Tomato and yougurt are needed',
               preparation_time: 1, cook_time: 2, user:)
    ingredient = RecipeFood.new(quantity: 2, food:)
    expect(ingredient).not_to be_valid
  end
end
