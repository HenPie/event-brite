class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    unless is_good_user?(params[:id])
      redirect_to user_path(current_user)
    end
      @user = current_user
      @events = Event.where(admin_id: current_user)
  end

  private 

  def is_good_user?(id)
    current_user = User.find(id)
  end

end
