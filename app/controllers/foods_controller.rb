class FoodsController < ApplicationController
  before_action :authenticate_user!
  def index
    # @user = User.find(params[:user_id])
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def show
    @food = Food.find(params[:id])
  end

  def create
    @food = Food.new(food_params)
    # @food.inventory_foods = .id
    if @food.save
      redirect_to foods_path, notice: 'Food was successfully created'
    else
      render :new, alert: 'Error: Food not saved'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    if @food.destroy
      redirect_to foods_path, notice: 'Food was successfully deleted'
    else
      render :new, alert: 'Error: Food not saved'
    end
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
