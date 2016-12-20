class UsersController < ApplicationController

  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # flash[:notice] = 'success'
      flash[:success] = 'Welcome to the sample app!'
      # redirect_to @user
      redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    redirect_to 'show'
    debugger
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
