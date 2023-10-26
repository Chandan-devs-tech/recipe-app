require 'rails_helper'

RSpec.describe 'recipes/new', type: :view do
  before(:each) do
    assign(:recipe, Recipe.new(
                      name: 'MyString',
                      preparation_time: 1,
                      cook_time: 1,
                      description: 'MyText',
                      public: false,
                      user: nil
                    ))
  end

  it 'renders new recipe form' do
    render

    assert_select 'form[action=?][method=?]', recipes_path, 'post' do
      assert_select 'input[name=?]', 'recipe[name]'

      assert_select 'input[name=?]', 'recipe[preparation_time]'

      assert_select 'input[name=?]', 'recipe[cook_time]'

      assert_select 'textarea[name=?]', 'recipe[description]'

      assert_select 'input[name=?]', 'recipe[public]'

      assert_select 'input[name=?]', 'recipe[user_id]'
    end
  end
end
