require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    User.create(name: 'Nurka', email: 'nurka@gmail.com', password: 'nurka12')
  end

  before(:each) do
    @food = Food.new(name: 'Burger', measurement_unit: 'gram', price: 230, quantity: 4, user_id: subject.id)
  end

  context 'Testing validations' do
    it 'Validation should be successful' do
      expect(@food).to be_valid
    end

    it 'Food should have a name' do
      expect(@food.name).to be_present
    end

    it 'Food should have a measurement unit' do
      expect(@food.measurement_unit).to be_present
    end

    it 'Food should have a price' do
      expect(@food.price).to be_present
    end

    it 'Food should have a valid price' do
      expect(@food.price).to be >= 0
    end

    it 'Food price should be numeric' do
      expect(@food.price).to be_a_kind_of(Numeric)
    end

    it 'Food should have a quantity' do
      expect(@food.quantity).to be_present
    end

    it 'Food quantity should be numeric' do
      expect(@food.quantity).to be_a_kind_of(Numeric)
    end

    it 'Food should have a valid quantity' do
      expect(@food.quantity).to be >= 0
    end

    it 'Food should have a user id' do
      expect(@food.user_id).to be_present
    end
  end

  context 'Testing associations' do
    it 'Food should belong to a user' do
      @food = Food.reflect_on_association(:user)
      expect(@food.macro).to eq(:belongs_to)
    end

    it 'Food should have many recipe items' do
      @food = Food.reflect_on_association(:recipe_foods)
      expect(@food.macro).to eq(:has_many)
    end
  end
end
