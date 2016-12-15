class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:email, :password, :password_confirmation))
    debugger
    if @user.save
      flash[:notice] = 'success'
      # redirect_to new_session_path
      redirect_to root_path
    else
      # render action: :new
      render 'new'
    end
  end


  private
    def user_params
      params.require(:user).permit(:email,:password,:password_confirmation)
    end
end

