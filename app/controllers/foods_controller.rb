class FoodsController < ApplicationController
  # GET /foods or /foods.json
  def index
    @foods = current_user.foods
  end

  # GET /foods/1 or /foods/1.json
  def show
    @food = Food.find(params[:id])
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  def edit
    @food = Food.find(params[:id])
  end

  # POST /foods or /foods.json
  def create
    @food = current_user.foods.new(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to foods_path, notice: 'Food was successfully created.' }
      else
        flash[:alert] = 'Oops, Loser try again!'
      end
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    food = Food.find(params[:id])
    respond_to do |format|
      if food.destroy
        format.html { redirect_to foods_path, notice: 'Food was deleted successfully.' }
      else
        format.html { render :new, alert: 'An error has occurred while deleting food, try again' }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
