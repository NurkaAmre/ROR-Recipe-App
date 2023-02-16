class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes.includes(:user)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods.includes([:food])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      redirect_to recipes_path, notice: 'Recipe was successfully created.'
    else
      flash[:alert] = 'Oops, Loser try again!'
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    respond_to do |format|
      if recipe.destroy
        format.html { redirect_to recipes_path, notice: 'Recipe was deleted successfully.' }
      else
        format.html { render :new, alert: 'An error has occurred while deleting the recipt, try again' }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :description, :public, :preparation_time, :public, :cooking_time)
  end
end
