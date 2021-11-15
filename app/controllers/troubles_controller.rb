class TroublesController < ApplicationController
  def new
    @trouble = Trouble.new
  end

  def create
    Trouble.create(trouble_params)
    redirect_to troubles_path
  end

  def index
    @troubles = Trouble.order('created_at DESC')
  end

  def show
    @trouble = Trouble.find(params[:id])
    @answer = Answer.new
    @answers = @trouble.answers.includes(:user)
  end
  
  def destroy
    @trouble = Trouble.find(params[:id])
    @trouble.destroy
    redirect_to troubles_path
  end

  def edit
    @trouble = Trouble.find(params[:id])
  end

  def update
    trouble = Trouble.find(params[:id])
    trouble.update(trouble_params)
    redirect_to troubles_path
  end


  private
  def trouble_params
    params.require(:trouble).permit(:title, :content).merge(user_id: current_user.id,)
  end
end