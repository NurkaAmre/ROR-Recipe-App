require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create!(name: 'Amre', email: 'amre@mail.com', password: 'amre12')
  end

  before { subject.save }

  it 'should have username Amre' do
    expect(subject.name).to eql('Amre')
  end

  it 'should have email present' do
    expect(subject.email).to eql('amre@mail.com')
  end

  it 'email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end
