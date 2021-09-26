class FavoritesController < ApplicationController
  before_action :set_recipe, only: [:create, :destroy]
  def index
    @favorites = Favorite.where(user_id: current_user.id)
    @recipes = Recipe.all
  end
  
  def create
    Favorite.create(user_id: current_user.id, recipe_id: params[:id])
  end

  def destroy
    Favorite.find_by(user_id: current_user.id, recipe_id: params[:id]).destroy
  end

  def rank
    @rank = Recipe.find(Favorite.group(:recipe_id).order('count(recipe_id) DESC').pluck(:recipe_id))
  end

  private
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end