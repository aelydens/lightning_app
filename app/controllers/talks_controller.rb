class TalksController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @talk = @user.talks.new(talk_params)
    @user_talks = Talk.where(user_id: @user.id)
    if @talk.save
      redirect_to user_path(@user), notice: "Thanks for signing up for a talk!"
    else
      render template: "users/show"
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @talk = Talk.find(params[:id])
  end

  def update
    @talk = Talk.find(params[:id])
    if @talk.update(talk_params)
      redirect_to root_path
      flash[:success] = "Talk was successfully updated."
    else
      render template: "users/edit"
    end
  end

  private
    def talk_params
      params.require(:talk).permit(:date, :topics)
    end
end
