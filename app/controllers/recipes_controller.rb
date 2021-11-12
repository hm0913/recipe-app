class RecipesController < ApplicationController
  before_action :set_action, only: [:edit, :update, :destroy, :show]
  
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
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to user_path(current_user[:id]), notice: "メニューを投稿しました。"
    else
      redirect_to new_recipe_path, alert: "投稿に失敗しました。"
    end
  end

  def edit
    @categorys = Category.all
    @orders = Order.all
  end

  def update
    if @recipe.update(update_recipe_params)
      redirect_to root_path, notice: "メニュー内容を編集しました。"
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    if @recipe.destroy
      redirect_to root_path, notice: "メニューを削除しました。"
    else
      render :edit
    end
  end

  def show
    @comment = Comment.new
    @comments = @recipe.comments.includes(:user)
    @ingredient = Ingredient.where(recipe_id: params[:id])
  end

  def search
    @recipes = Recipe.search(params[:keyword])
  end

  def research
    @serving_list = Recipe.where("serving_id >= ?", 5)
    @serving_list = Recipe.where(serving_id: params[:id])
  end

  def top
    @recipes = Recipe.order("created_at DESC").first(4)
    @rank = Recipe.find(Favorite.group(:recipe_id).order('count(recipe_id) DESC').pluck(:recipe_id)).first(4)
  end

  def set_action
    @recipe = Recipe.find(params[:id])
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :category_id, :image, :serving_id, :introduction, 
      ingredients_attributes:[:name, :amount, :recipe_id, :_destroy],
      makes_attributes:[:sentence, :recipe_id, :order_id, :_destroy]
    ).merge(user_id: current_user.id, )
  end

  def update_recipe_params
    params.require(:recipe).permit(:name, :category_id, :image, :serving_id, :introduction, 
      ingredients_attributes:[:name, :amount, :recipe_id, :_destroy, :id],
      makes_attributes:[:sentence, :recipe_id, :order_id, :_destroy, :id]
    ).merge(user_id: current_user.id, )
  end
end