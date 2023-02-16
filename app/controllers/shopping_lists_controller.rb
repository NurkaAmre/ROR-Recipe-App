class ShoppingListsController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = @recipe.recipe_foods.includes([:food])
    @total = sum(@recipe_foods)
  end

  def sum(recipe_foods)
    total = 0
    recipe_foods.each do |item|
      total += item.food.price * item.quantity.to_i
    end
    total
  end
end
