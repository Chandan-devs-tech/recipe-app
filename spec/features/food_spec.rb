require 'rails_helper'

RSpec.feature 'Foods', type: :feature do
  before :each do
    @user = User.new(name: 'Chandan', email: 'chandan@gmail.com', password: '123456')
    @food = Food.new(name: 'Potato', measurement_unit: 'kg', price: 3, quantity: 1, user: @user)
  end
  describe 'food#index page' do
    it 'Displays the food index page' do
      visit root_path
      click_link 'Sign up'
      fill_in 'Name', with: @user.name
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      fill_in 'Password confirmation', with: @user.password
      click_button 'Sign up'
      expect(page).to have_content('Foods')
      click_link 'New food'
      fill_in 'food[name]', with: @food.name
      fill_in 'food[measurement_unit]', with: @food.measurement_unit
      fill_in 'food[price]', with: @food.price
      fill_in 'food[quantity]', with: @food.quantity
      click_button 'Create Food'
      expect(page).to have_content(@food.name)
      expect(page).to have_content(@food.measurement_unit)
      expect(page).to have_content(@food.price)
      visit root_path
      click_button 'Delete'
      expect(page).not_to have_content(@food.name)
    end
  end
end
