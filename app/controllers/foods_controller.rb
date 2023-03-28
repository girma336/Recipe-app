class FoodsController < ApplicationController
  def index
    @foods = current_user.foods.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.new
  end
end
