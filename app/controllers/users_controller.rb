class UsersController < ApplicationController

  def index
    @users = User.all
    @user = current_user
    @user_completed_talks = Talk.where(completed: true)
    @upcoming_talks = Talk.where(completed: false)
    @user_upcoming_talks = @upcoming_talks.sort
  end

  def show
    @user = current_user
    @talk = Talk.new
    @user_talks = Talk.where(user_id: @user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password))
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You've successfully signed up!"
      redirect_to root_path
    else
      render :new
    end
  end

end
