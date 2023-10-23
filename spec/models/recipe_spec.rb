require 'rails_helper'

RSpec.describe Recipe, type: :model do
  @author = User.new(name: 'john')

  subject do
    Recipe.new(author: @author,
               name: 'Perfect Chicken',
               description: '',
               preparation_time: 10,
               cooking_time: 75)
  end

  before { subject.save }

  it 'should have an author' do
    subject.author = nil
    expect(subject).not_to be_valid
  end

  it 'should have a name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'should have a valid preparation time' do
    subject.preparation_time = nil
    expect(subject).not_to be_valid
  end

  it 'should have a valid cooking time' do
    subject.preparation_time = nil
    expect(subject).not_to be_valid
  end
end
