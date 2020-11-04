class EventsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @event_array = Event.all
  end

  def show 
    @event = Event.find(params[:id])
    @user = User.find(@event.admin_id)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new('title' => params[:title], 'location' => params[:location], 'price' => params[:price], 'start_date' => params[:start_date], 'duration' => params[:duration], 'description' => params[:description])
    @event.admin = current_user
    if @event.save 
      redirect_to root_path, flash: {success: "Évènement créé avec success" }
    else
      render 'new'
    end
  end

  def edit 
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to root_path
    else 
      render :edit 
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end

  private 

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :price, :location, :duration)
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
  
end
