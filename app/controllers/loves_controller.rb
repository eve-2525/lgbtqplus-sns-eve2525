class LovesController < ApplicationController
  before_action :worry_params

  def create
    Love.create(user_id: current_user.id, worry_id: params[:id])
    redirect_to worry_path
  end

  def destroy
    Love.find_by(user_id: current_user.id, worry_id: params[:id]).destroy
    redirect_to worry_path
  end

  private
 
  def worry_params
    @worry = Worry.find(params[:id])
    @love_count = Love.where(worry_id: params[:worry_id]).count
  end

end
