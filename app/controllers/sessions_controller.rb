class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "You've successfully logged in!"
      redirect_to user_path(@user)
    else
      flash[:notice] = "There has been an error"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
    flash[:notice] = "You've been successfully signed out."
  end

end
