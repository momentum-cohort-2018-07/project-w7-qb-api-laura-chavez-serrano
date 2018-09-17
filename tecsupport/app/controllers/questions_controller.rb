class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  def index
    # @questions = Question.all
    @questions = Question.page(params[:page])
  end

  # GET /questions/1
  def show
  end

  # GET /questions/new
  def new
    redirect_to questions_path, notice: 'You must be logged in to add a new question' if !(current_user)
    @question = Question.new
  end

  # question /questions
  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question, notice: 'question was successfully recorded.'
    else
      render :new, notice: "you need to login to enter a new Question. Please try again."
    end
  end

  # PATCH/PUT /questions/1
  def update
   
  end

  # DELETE /questions/1
  def destroy
    
    test=current_user.id.to_s
    if test == @question.user_id
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'question was successfully destructed.' }
    end
  else
    respond_to do |format|
    format.html { redirect_to questions_url, notice: 'You are not allow to delete the question.' }
  end
end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :body, :user_id, :image)
    end
end
