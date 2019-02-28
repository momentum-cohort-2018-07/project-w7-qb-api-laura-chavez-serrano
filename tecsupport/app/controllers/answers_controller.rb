class AnswersController < ApplicationController
  before_action :set_answer, only: [:update]
  
   
  
  
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
  def show
  end
    
  
    def update 
    ok_answer2 = false 
      (@answer.ok_answer==true)? ok_answer2 = false : ok_answer2 = true
      
        if @answer.update(ok_answer: ok_answer2)
          
          redirect_to root_path
        else
          redirect_to @question
          flash[:error_message] ="Try again"
        end
    
  
    end
  
     
  
  
  private 
  
  def set_answer
    
    @answer = Answer.find(params[:answer_id])

  end
  
  def answer_params
    params.require(:answer).permit(:user_id, :body, :question_id, :ok_answer)
    
  end
  
  end
  
