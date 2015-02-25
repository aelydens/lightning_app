class TalksController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @talk = @user.talks.create(talk_params)
    redirect_to user_path(@user)
  end

  private
    def talk_params
      params.require(:talk).permit(:date, :topics)
    end
end
