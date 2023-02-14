class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def edit
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
      if @recipe.save
         redirect_to recipes_path, notice: "Recipe was successfully created."
      else
        flash[:alert] = 'Oops, Loser try again!'
      end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    if recipe.destroy
      flash[:notice] = "Recipe was successfully destroyed." 
    else
      flash[:notice] = "Oops, Loser try again." 
    end
    redirect_back(fallback_location: root_path)
  end

  private
  # Only allow a list of trusted parameters through.
    def recipe_params
      params.require(:recipe).permit(:name, :description, :public, :preparation_time, :cooking_time )
    end
end
