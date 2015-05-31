class EventsController < ApplicationController
  def index
        @events = Event.all
        @locations = Location.all
        @organizations = Organization.all
    end
    
    def new
        @event = Event.new
        @locations = Location.all
        @organizations = Organization.all
    end
    
    def create
        @event = Event.new(event_params)
        
        if @event.save
            redirect_to events_path
        else
            render 'new'
        end
    end
    
    def destroy
        @event = Event.find(params[:id])
        @event.destroy
        
        redirect_to events_path
    end
    
    def edit
        @event = Event.find(params[:id])
        @locations = Location.all
        @organizations = Organization.all
    end
    
    def update
        @event = Event.find(params[:id])
        
        if @event.update(event_params)
            redirect_to events_path
        else
            render 'edit'
        end
    end
    
    def show
    end
    
    private
        def event_params
            params.require(:event).permit(:name, :fullName, :owner_id, :location_id, :startDate, :endDate, :description, :tags)
        end
end
