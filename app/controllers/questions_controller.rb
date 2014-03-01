class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]
  before_filter :get_question, :only => [:show, :edit, :update, :destroy, :answer]

  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    add_user

    if @question.save
      flash[:notice] = "Question was successfully created."
      redirect_to @question
    else
      # we'll get to this in a bit
    end
  end

  def edit
  end

  def update
    add_user
    p @question.users
    if @question.update(question_params)

      flash[:notice] = "Question was successfully updated."
      redirect_to @question
      # we'll get to this in a bit
    end
  end

  def answer
  end

  def destroy
    if @question.destroy
      flash[:notice] = "Question was successfully deleted."
      redirect_to questions_path
    else
      # we'll get to this in a bit
    end
  end

  private

  def get_question
    @question = Question.find(params[:id])
  end

  def add_user
    return unless(current_user)
    @question.users ||= []
    @question.users |= [current_user]
  end

  def question_params
    params.require(:question).permit(:question, :answer)
  end
end
