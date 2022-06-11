class LovesController < ApplicationController

  def create
    Love.create(user_id: current_user.id, worry_id: params[:id])
    redirect_to worry_path
  end

  def destroy
    Love.find_by(user_id: current_user.id, worry_id: params[:id]).destroy
    redirect_to worry_path
  end

end
