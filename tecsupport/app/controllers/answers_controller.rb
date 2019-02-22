class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :update, :destroy]
  before_action :set_question, only: [:show, :update, :destroy]
   
  def index
     
     @answers = Answer.where(question_id: params[:question_id])
    
  end
  
  def new 
    redirect_to questions_path, notice: 'You must be logged in to comment' if !(current_user)
    @answer = Answer.new 
  end 
  
  def create 
    
    @answer = Answer.new(answer_params) 
    
    if @answer.save
      question_id = @answer.question_id
      user_id = ''
      email=''
       @question = Question.find_by("id = ?", question_id)
       user_id=@question.user_id  
      @user2 = User.find_by("id = ?", user_id)
      UserMailer.newanswer(@user2).deliver_now
      redirect_to questions_path, notice: 'Answer was successfully recorded.'
    else
      render :new 
    end
  end
  
    def edit 
      byebug
       @answer = Answer.find(params[:id])
    end  
  
    def update 
     
      if current_user.id != @question.user_id
        redirect_to @question
        flash[:error_message] ="You can't mark answer"
      else
        if @answer.update(answer_params)
          redirect_to root_path
        else
          redirect_to @question
          flash[:error_message] ="Try again"
        end
      end
  
    end
  
    def destroy 
      @answer.destroy
      respond_to do |format|
        format.html { redirect_to questions_path, notice: 'answer was successfully destructed.' }
      end
    end   
  
  
  private 
  
  def set_answer
    
    @answer = answer.find(params[:id])

  end
  
  def answer_params
    params.permit(:user_id, :body, :question_id, :ok_answer)
  end
  
  end
  
