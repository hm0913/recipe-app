class CategoriesController < ApplicationController
  def show
    @category = Recipe.where(category_id: params[:id])
  end
end