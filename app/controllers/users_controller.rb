class UsersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :image)
  end
end