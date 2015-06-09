class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @organization = Organization.find(@user.organization_id)
  end
  
  def index
    @users = User.all
    @organizations = Organization.all
  end
  
  def new
    @user = User.new
    @organizations = Organization.all
  end
  
  def edit
    @user = User.find(params[:id])
    @organizations = Organization.all
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end
  
  def destroy
      @user = User.find(params[:id])
      @user.destroy
      
      redirect_to users_path
  end
  
  private
    def user_params
      params.require(:user).permit(:login, :password, :password_confirmation, :name, :surname, :email, :address, :tags, :organization_id, :phone)
    end
end
