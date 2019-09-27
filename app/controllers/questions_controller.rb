class QuestionsController < ApplicationController

  # before_action :set_question, expect: [:index]

  def index
  end

  private

  def set_question
    @question = Question.find_by_id(params[:id])
    return false if @question.nil?
  end

  def question_params
    params.require(:question).permit(:content)
  end

end