class EventsController < ApplicationController
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

end
