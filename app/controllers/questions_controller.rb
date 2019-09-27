class QuestionsController < ApplicationController

  before_action :set_question, except: [:index, :new, :create]

  def index
    @questions = Question.order('created_at DESC').paginate(page: params[:page], per_page: 10)
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to questions_path, notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to questions_path, notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @question.destroy
    redirect_to questions_path, notice: 'Question was successfully destroyed.'
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