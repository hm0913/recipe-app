class CategoriesController < ApplicationController
  def show
    @category = Recipe.where(category_id: params[:id])
    @categories = Category.find(params[:id])
  end
end