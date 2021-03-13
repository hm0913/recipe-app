class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(user_id: current_user.id)
    @recipes = Recipe.all
  end
  
  def create
    Favorite.create(user_id: current_user.id, recipe_id: params[:id])
    flash[:success] = "お気に入りに登録しました。"
    redirect_back fallback_location: root_path
  end

  def destroy
    Favorite.find_by(user_id: current_user.id, recipe_id: params[:id]).destroy
    flash[:success] = "お気に入りを解除しました。"
    redirect_back fallback_location: root_path
  end
end
