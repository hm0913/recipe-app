class RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.order("created_at DESC")
  end

  def new
    @recipe = Recipe.new
    @categorys = Category.all
    @orders = Order.all
    @recipe.ingredients.build
    @recipe.makes.build
    
  end

  def create
    Recipe.create(recipe_params)
    redirect_to root_path
  end


  private
  def recipe_params
    params.require(:recipe).permit(:name, :category_id, :image, :serving, :introduction, 
      ingredients_attributes:[:name, :amount, :recipe_id, :_destroy],
      makes_attributes:[:sentence, :recipe_id, :order_id, :_destroy]
    ).merge(user_id: current_user.id, )
  end
end