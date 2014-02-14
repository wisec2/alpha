class UserToEventMapsController < ApplicationController

def new
  @map = UserToEventMap.new
end

def create
  # TODO: Make a new UserToEventMap object with the event ID (pulled from event page), and user ID (pulled from session).
  @eid = params[:eid]
  @uid = params[:uid]

  @map = UserToEventMap.new(params.permit(:eid, :uid))
  
  if @map.save  
    redirect_to events_path(params[:eid])
  else
    redirect_to events_path
  end
end

end
