class InventoryFoodsController < ApplicationController
  load_and_authorize_resource only: [:dashBoard], find_by: :slug
  before_action :authenticate_user!
  # before_action :find_user
  def new
    @inventory_food = InventoryFood.new
  end

  def create
    inventory_food = InventoryFood.new(inventory_food_params)
    respond_to do |format|
      if inventory_food.save
        flash[:notice] = 'Created an inventory food succesfully'
        format.html { redirect_to "/inventories/#{params[:id]}" }
      else
        flash[:notice] = 'Failed to create an inventory food. Try again'
        format.html { redirect_to "/inventories/#{params[:id]}/inventory_foods/new" }
      end
    end
  end

  def destroy
    @inventory_food = InventoryFood.find(params[:id])
    if @inventory_food.destroy
      redirect_to "/inventories/#{params[:id]}", notice: 'Recipe Food was deleted successfully'
    else
      flash.now[:alert] = @inventory_food.errors.full_messages.first if @inventory_food.errors.any?
      render :new, status: 400
    end
  end

  private

  def inventory_food_params
    params.require(:inventory_food).permit(:inventory_id, :food_id, :quantity)
  end
end
