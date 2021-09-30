class AnswersController < ApplicationController
  def create
    answer = Answer.create(answer_params)
    redirect_to root_path
  end

  def destroy
    @trouble = Trouble.find(params[:trouble_id])
    @answer = @trouble.answers.find(params[:id])
    @answer.destroy
    redirect_to root_path
  end

  private

  def answer_params
    params.require(:answer).permit(:text).merge(user_id: current_user.id, trouble_id: params[:trouble_id])
  end
end
