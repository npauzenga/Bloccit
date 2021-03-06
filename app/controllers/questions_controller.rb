class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Question posted!"
      redirect_to @question
    else
      flash[:notice] = "Something went wrong. Try again."
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      flash[:notice] = "Question updated"
      redirect_to @question
    else
      flash[:notice] = "Please try again"
      render :edit
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :resolved)
  end
end
