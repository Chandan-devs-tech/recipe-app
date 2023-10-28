require 'rails_helper'

RSpec.feature 'Recipes', type: :feature do
  before :each do
    @user = User.new(name: 'Chand', email: 'chand@gmail.com', password: '123456')
    @recipe = Recipe.new(name: 'Cookie', description: 'Flour', preparation_time: 1, cook_time: 2, user: @user)
  end
  describe 'recipe#index page' do
    it 'Displays the recipe index page' do
      visit recipes_path
      click_link 'Sign up'
      fill_in 'Name', with: @user.name
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      fill_in 'Password confirmation', with: @user.password
      click_button 'Sign up'
      expect(page).to have_current_path(recipes_path)
      expect(page).to have_content('Recipes')
      click_link 'New recipe'
      expect(page).to have_current_path(new_recipe_path)
      fill_in 'recipe[name]', with: @recipe.name
      fill_in 'recipe[preparation_time]', with: @recipe.preparation_time
      fill_in 'recipe[cook_time]', with: @recipe.cook_time
      fill_in 'recipe[description]', with: @recipe.description
      click_button 'Create Recipe'
      visit recipes_path
      expect(page).to have_content(@recipe.name)
      expect(page).to have_content(@recipe.description)
      click_button 'Remove'
      expect(page).not_to have_content(@recipe.name)
    end
  end
end
