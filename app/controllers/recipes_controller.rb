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
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to user_path(current_user[:id]), notice: "メニューを投稿しました。"
    else
      redirect_to new_recipe_path, alert: "投稿に失敗しました。"
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @categorys = Category.all
    @orders = Order.all
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(update_recipe_params)
      redirect_to root_path, notice: "メニュー内容を編集しました。"
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    if @recipe.destroy
      redirect_to root_path, notice: "メニューを削除しました。"
    else
      render :edit
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @comment = Comment.new
    @comments = @recipe.comments.includes(:user)
  end

  def search
    @recipes = Recipe.search(params[:keyword])
  end

  def research
    if params[:id].to_i >= 5
      @recipe = Recipe.where("serving >= ?", 5)
    else
      @recipe = Recipe.where(serving: params[:id])
    end
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :category_id, :image, :serving, :introduction, 
      ingredients_attributes:[:name, :amount, :recipe_id, :_destroy],
      makes_attributes:[:sentence, :recipe_id, :order_id, :_destroy]
    ).merge(user_id: current_user.id, )
  end

  def update_recipe_params
    params.require(:recipe).permit(:name, :category_id, :image, :serving, :introduction, 
      ingredients_attributes:[:name, :amount, :recipe_id, :_destroy, :id],
      makes_attributes:[:sentence, :recipe_id, :order_id, :_destroy, :id]
    ).merge(user_id: current_user.id, )
  end
end