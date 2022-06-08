class LovesController < ApplicationController

  def create
    Like.create(user_id: current_user.id, worry_id: params[:id])
    redirect_to posts_path
  end


end
