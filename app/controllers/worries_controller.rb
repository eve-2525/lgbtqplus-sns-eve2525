class WorriesController < ApplicationController
  def indexmain
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





end
