require 'rails_helper'

RSpec.describe 'recipes/edit', type: :view do
  let(:recipe) do
    Recipe.create!(
      name: 'MyString',
      preparation_time: 1,
      cook_time: 1,
      description: 'MyText',
      public: false,
      user: nil
    )
  end

  before(:each) do
    assign(:recipe, recipe)
  end

  it 'renders the edit recipe form' do
    render

    assert_select 'form[action=?][method=?]', recipe_path(recipe), 'post' do
      assert_select 'input[name=?]', 'recipe[name]'

      assert_select 'input[name=?]', 'recipe[preparation_time]'

      assert_select 'input[name=?]', 'recipe[cook_time]'

      assert_select 'textarea[name=?]', 'recipe[description]'

      assert_select 'input[name=?]', 'recipe[public]'

      assert_select 'input[name=?]', 'recipe[user_id]'
    end
  end
end
