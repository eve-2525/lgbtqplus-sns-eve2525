class WorriesController < ApplicationController
  def indexmain
    @worries = Worry.all
  end

def new
  @worry = Worry.new
end

def index
  @user = User.new
end

def create
  @worry = Worry.new(worry_params)
  if @worry.save
    redirect_to indexmain_worry_path(current_user)
  else
    render :new
  end
end

def show
  @worry = Worry.find(params[:id])
end




private

def worry_params
  params.require(:worry).permit(:title, :problem, :status, :situation).merge(user_id: current_user.id)
end



end
