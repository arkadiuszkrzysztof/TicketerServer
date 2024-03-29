class OrganizationsController < ApplicationController
    def index
        @organizations = Organization.all
    end
    
    def new
        @organization = Organization.new
    end
    
    def create
        @organization = Organization.new(organization_params)
        
        if @organization.save
            redirect_to organizations_path
        else
            render 'new'
        end
    end
    
    def destroy
        @organization = Organization.find(params[:id])
        @organization.destroy
        
        redirect_to organizations_path
    end
    
    def edit
        @organization = Organization.find(params[:id])
    end
    
    def update
        @organization = Organization.find(params[:id])
        
        if @organization.update(organization_params)
            redirect_to organizations_path
        else
            render 'edit'
        end
    end
    
    def show
        @organization = Organization.find(params[:id])
        @events = Event.where(owner_id: params[:id]).order(startDate: :asc)
    end
    
    private
        def organization_params
            params.require(:organization).permit(:name, :fullName, :address, :phone, :email, :tags)
        end
end
