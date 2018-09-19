class Api::V1::QuestionsController < ApplicationController
  before_action :verify_authentication
  skip_before_action :verify_authentication, only: [:index, :show]
        before_action :set_question, only: [:show, :destroy]
        helper_method :current_user
        def index
          @questions = Question.order('created_at DESC').page(params[:page]).per(10)
          render :json => @questions
        end
      
        def show
            @question = Question.find(params[:id])
        render :json => @question
        end
      
        def create
           if !token_user
            render json: {error: "Must be logged in to question"}, status: :unprocessable_entity
           else
             @question = Question.create(
                title: params[:title],
                body: params[:body],
                user_id: token_user.id)

               render json: @question
          end
        end
      
        def destroy
          if token_user.id != @user.id
            render json: {error: "Must be the user to Delete This question"}
          else
            @question.destroy
            render json: @user.questions
          end
        end
      


        private
      
        def set_user
           @user = User.find(params[:user_id])
          
        end
      
        def set_question
         
          @question= Question.find(params["id"])
          @user = @question.user
        end

        def question_params
      
          params.require(:question).permit(:title, :body)
        end

      
end
