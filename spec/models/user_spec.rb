require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'john') }

  before { subject.save }

  it 'validity' do
    expect(subject).to be_valid
  end
end
