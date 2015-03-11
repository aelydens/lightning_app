class TalksController < ApplicationController

  before_action :set_user

  def show
    @talk = @user.talks.find([:id])
  end

  def index
    
    @talks = @user.talks.all
  end

  def new
  end

  def create
    @talk = @user.talks.new(talk_params)
    @user_talks = Talk.where(user_id: @user.id)
    if @talk.save
      redirect_to user_path(@user), notice: "Thanks for signing up for a talk!"
    else
      render template: "users/show"
    end
  end

  def edit
    @talk = Talk.find(params[:id])
  end

  def update
    @talk = Talk.find(params[:id])
    if @talk.update(talk_params)
      redirect_to root_path
      flash[:success] = "Talk was successfully updated."
    else
      render template: "talks/edit"
    end
  end

  def destroy
    talk = Talk.find(params[:id])
    talk.destroy
    redirect_to root_path
  end

  private

  def talk_params
    params.require(:talk).permit(:date, :topics)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
