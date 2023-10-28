class ShoppingListController < ApplicationController
  def index
    @recipe_foods = RecipeFood.all
    @food = Food.includes(:recipe_foods).where(user_id: current_user.id)
    @total_price = 0
    # @recipe_foods.each do |recipe_food|
    # @total_price += recipe_food.food.price * recipe_food.quantity
    # end
    displayed_names = []
    @recipe_foods.each do |recipe_food|
      unless displayed_names.include?(recipe_food.food.name)
        displayed_names << recipe_food.food.name
        @total_price += recipe_food.food.price * recipe_food.quantity
      end
    end
    @displayed_names = displayed_names
  end
end
