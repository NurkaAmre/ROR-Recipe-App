require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    User.create(name: 'Amre', email: 'amre@gmail.com', password: 'amre12')
  end

  before(:each) do
    @recipe = Recipe.new(user_id: subject.id, name: 'Taco', description: 'Mexican delicious spicy food',
                         preparation_time: 1, cooking_time: 2, public: false)
  end

  context 'Testing validations' do
    it 'Validation should be successful' do
      expect(@recipe).to be_valid
    end

    it 'Recipe should have a name' do
      expect(@recipe.name).to be_present
    end

    it 'Recipe should have a description' do
      expect(@recipe.description).to be_present
    end

    it 'Recipe should have a preparation time' do
      expect(@recipe.preparation_time).to be_present
    end

    it 'Recipe should have a valid preparation time' do
      expect(@recipe.preparation_time).to be >= 0
    end

    it 'Recipe preparation time should be numeric' do
      expect(@recipe.preparation_time).to be_a_kind_of(Numeric)
    end

    it 'Recipe should have a cooking time' do
      expect(@recipe.cooking_time).to be_present
    end

    it 'Recipe cooking time should be numeric' do
      expect(@recipe.preparation_time).to be_a_kind_of(Numeric)
    end

    it 'Recipe should have a valid cooking time' do
      expect(@recipe.cooking_time).to be >= 0
    end

    it 'Recipe should have a user id' do
      expect(@recipe.user_id).to be_present
    end
  end

  context 'Testing associations' do
    it 'Recipe should belong to a user' do
      @recipe = Recipe.reflect_on_association(:user)
      expect(@recipe.macro).to eq(:belongs_to)
    end

    it 'Recipe should have many recipe foods' do
      @recipe = Recipe.reflect_on_association(:recipe_foods)
      expect(@recipe.macro).to eq(:has_many)
    end
  end
end
