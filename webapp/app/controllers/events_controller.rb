class EventsController < ApplicationController

def new
  @event = Event.new
end

def create
  @event = Event.new(params[:event].permit(:title, :description))

  if @event.save
    redirect_to @event
  else
    render 'new'
  end

end

def edit
  @event = Event.find(params[:id])
end

def update
  @event = Event.find(params[:id])

  if @event.update(params[:event].permit(:title, :description))
    redirect_to @event
  else
    render 'edit'
  end
end

def show
  @event = Event.find(params[:id])
end

def destroy
  @event = Event.find(params[:id])
  @event.destroy

  redirect_to events_path
end

def index
  @events = Event.all
end

private
  def event_params
    params.require(:event).permit(:title, :description)
  end

end
