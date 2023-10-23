require 'rails_helper'

RSpec.describe 'Recipes', type: :system do
  before(:all) do
    Ingredient.delete_all
    Recipe.delete_all

    @author = User.first || User.create(name: 'John')
    @recipe1 = Recipe.create(author: @author,
                             name: 'Perfect Chicken',
                             description: 'Description for Perfect Chicken',
                             preparation_time: 10,
                             cooking_time: 75)
    @recipe2 = Recipe.create(author: @author,
                             name: 'Johnny Marzetti Casserole',
                             description: 'Description for Johnny Marzetti Casserole',
                             preparation_time: 30,
                             cooking_time: 65)
    @recipes = Recipe.all
  end

  it 'I can see the recipes titles' do
    visit recipes_path
    @recipes.each do |recipe|
      expect(page).to have_content(recipe.name)
    end
  end

  it 'I can see the recipes descriptions' do
    visit recipes_path
    @recipes.each do |recipe|
      expect(page).to have_content(recipe.description)
    end
  end

  it 'When I click on a recipe, it takes me to the details' do
    visit recipes_path
    click_link @recipe1.name
    expect(page).to have_current_path(recipe_path(@recipe1.id))
  end
end
