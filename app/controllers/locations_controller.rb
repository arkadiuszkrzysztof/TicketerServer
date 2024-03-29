class LocationsController < ApplicationController
    def index
        @locations = Location.all
    end
    
    def new
        @location = Location.new
    end
    
    def create
        @location = Location.new(location_params)
        
        if @location.save
            redirect_to locations_path
        else
            render 'new'
        end
    end
    
    def destroy
        @location = Location.find(params[:id])
        @location.destroy
        
        redirect_to locations_path
    end
    
    def edit
        @location = Location.find(params[:id])
    end
    
    def update
        @location = Location.find(params[:id])
        
        if @location.update(location_params)
            redirect_to locations_path
        else
            render 'edit'
        end
    end
    
    def show
        @location = Location.find(params[:id])
        @events = Event.where(location_id: params[:id]).order(startDate: :asc)
    end
    
    private
        def location_params
            params.require(:location).permit(:name, :fullName, :address, :phone, :email, :description, :capacity, :tags)
        end
end
