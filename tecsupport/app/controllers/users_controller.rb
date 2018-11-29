class UsersController < ApplicationController
  def show
    
    @user = User.find(params[:id])
    # @questions=Question.where("user_id=?",@user.id).page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.signup(@user).deliver_now
      redirect_to @user
    else
      render new_user_path
    end
  end

  private
  

    def user_params
      params.require(:user).permit(:username, :password,
                                   :password_confirmation, :email)
    end
end
