class ShoppingListController < ApplicationController
  def index
    @user = current_user
    @recipes = @user.recipes
    @user_foods = @user.foods
    @shopping_list = Hash.new { |hash, key| hash[key] = { quantity: 0, price: 0.0 } }
    # Iterate through the recipes and consolidate ingredients
    @recipes.each do |recipe|
      recipe.recipe_foods.each do |recipe_food|
        user_food = @user_foods.find_by(name: recipe_food.food.name)
        missing_quantity = user_food.nil? ? recipe_food.quantity : [recipe_food.quantity - user_food.quantity, 0].max
        # Update the shopping list with consolidated data
        @shopping_list[recipe_food.food.name][:quantity] += missing_quantity
        @shopping_list[recipe_food.food.name][:price] += missing_quantity * recipe_food.food.price
      end
    end
    # Convert the hash into an array for display
    @shopping_list = @shopping_list.map do |food_name, data|
      { name: food_name, quantity: data[:quantity], price: data[:price] }
    end
    @total_items = @shopping_list.length
    @total_cost = @shopping_list.sum { |item| item[:price] }
  end
end
