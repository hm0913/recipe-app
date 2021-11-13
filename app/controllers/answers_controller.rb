class AnswersController < ApplicationController
  def create
    answer = Answer.create(answer_params)
    if answer.save
      redirect_back fallback_location: root_path, notice: "回答が完了しました"
    else
      redirect_back fallback_location: root_path, alert: "コメントを入力してください"
    end
  end
  
  def destroy
    @trouble = Trouble.find(params[:trouble_id])
    @answer = @trouble.answers.find(params[:id])
    @answer.destroy
    redirect_back fallback_location: root_path
  end

  private
  def answer_params
    params.require(:answer).permit(:text).merge(user_id: current_user.id, trouble_id: params[:trouble_id])
  end
end
