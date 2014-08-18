class RaterController < ApplicationController

  def create
    if user_signed_in?
      obj = params[:klass].classify.constantize.find(params[:id])
      obj.rate params[:score].to_f, current_user, params[:dimension]

      render :json => true
      puts "id = #{params[:id]}, stars = #{params[:score]}, user = #{current_user.username}"
      AdminMailer.notify_about_rating(params[:id],params[:score],current_user).deliver
    else
      render :json => false
    end
  end
end
