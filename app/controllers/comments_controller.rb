class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_back fallback_location: root_path
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.find(params[:id])
    @comment.destroy
    redirect_back fallback_location: root_path
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, recipe_id: params[:recipe_id])
  end
end