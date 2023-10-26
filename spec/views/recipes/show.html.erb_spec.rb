require 'rails_helper'

RSpec.describe 'recipes/show', type: :view do
  before(:each) do
    assign(:recipe, Recipe.create!(
                      name: 'Name',
                      preparation_time: 2,
                      cook_time: 3,
                      description: 'MyText',
                      public: false,
                      user: nil
                    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
