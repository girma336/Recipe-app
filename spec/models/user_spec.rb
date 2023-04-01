require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Girma', email: 'test@gmail.com', password: 'password', role: 'user') }
  before { subject.skip_confirmation! }
  before { subject.save }
  it 'User inharitans from ApplicationRecord' do
    expect(User < ApplicationRecord).to eq(true)
  end

  it 'return corrent name' do
    expect(subject.name).to eq('Girma')
  end

  it 'Return correct email validate' do
    expect(subject.email).to eq('test@gmail.com')
  end

  it 'Name Should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
