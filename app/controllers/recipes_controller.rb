class RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.all
  end

  def new
    @categorys = Category.all
    @recipe = Recipe.new
    
  end

  def create
    Recipe.create(recipe_params)
    redirect_to root_path
  end


  private
  def recipe_params
    params.require(:recipe).permit(:name, :category_id, :image, :introduction).merge(user_id: current_user.id, )
  end
end