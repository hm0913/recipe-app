class BuyItemsController < ApplicationController
  before_action :set_item, only: [:create, :destroy]
  def create
    BuyItem.create(buy_item_params)
  end

  def destroy
    buy_item_record = BuyItem.find_by(user_id: buy_item_params[:user_id], recipe_id: buy_item_params[:recipe_id], ingredient_id: buy_item_params[:ingredient_id]).destroy
  end

  def destroy_all
    buy_item_all = BuyItem.where(user_id: buy_item_params[:user_id], recipe_id: buy_item_params[:recipe_id]).destroy_all
    redirect_back fallback_location: root_path
  end

  private
  def buy_item_params
    params.require(:buy_item).permit(:user_id, :recipe_id, :ingredient_id)
  end

  def set_item
    @ingredient = Ingredient.find(buy_item_params[:ingredient_id])
  end
end