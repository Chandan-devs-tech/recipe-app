class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.includes(:user).where(public: true).order(created_at: :desc)
    # @recipe = Recipe.find(params[:id])
    # @recipe_foods = @recipe.recipe_foods
  end
end
