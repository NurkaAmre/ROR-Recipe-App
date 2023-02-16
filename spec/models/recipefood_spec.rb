require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before(:each) do
    @user = User.create(name: 'Amre', email: 'amre@gmail.com', password: 'amre12')
    @food = Food.create(name: 'Meat', measurement_unit: 'kg', price: 230, quantity: 2, user_id: @user.id)
    @recipe = Recipe.create(name: 'Taco', description: 'Mexican spicy delicious food',
                            preparation_time: 1, cooking_time: 2, user_id: @user.id, public: false)
    @recipe_food = RecipeFood.new(recipe: @recipe, food: @food, quantity: 3)
  end

  context 'Testing validations' do
    it 'Validation should be successful' do
      expect(@recipe_food).to be_valid
    end

    it 'Recipe food should have a recipe' do
      expect(@recipe_food.recipe).to be_present
    end

    it 'Recipe food should validate if recipe id' do
      @recipe_food.recipe = nil
      expect(@recipe_food).to_not be_valid
    end

    it 'Recipe food should have a food' do
      expect(@recipe_food.food).to be_present
    end

    it 'Recipe food should validate if food id' do
      @recipe_food.food = nil
      expect(@recipe_food).to_not be_valid
    end

    it 'Recipe food should have a quantity' do
      expect(@recipe_food.quantity).to be_present
    end
  end

  context 'Testing associations' do
    it 'Recipe food should belong to a recipe' do
      @recipe_food = RecipeFood.reflect_on_association(:recipe)
      expect(@recipe_food.macro).to eq(:belongs_to)
    end

    it 'Recipe food should belong to a food' do
      @recipe_food = RecipeFood.reflect_on_association(:food)
      expect(@recipe_food.macro).to eq(:belongs_to)
    end
  end
end
