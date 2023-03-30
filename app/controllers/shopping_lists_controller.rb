class ShoppingListsController < ApplicationController
  def index
    @recipe = Recipe.find(params[:id])
    @inventories = Inventory.find(params[:id]).includes(:food)
  end
end
