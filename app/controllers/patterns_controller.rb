class PatternsController < ApplicationController
  def index
    @patterns = Pattern.all
  end
  
  def new
    @pattern = Pattern.new
  end
  
  def create
      @pattern = Pattern.new(pattern_params)
      
      if @pattern.save
          redirect_to patterns_path
      else
          render 'new'
      end
  end
  
  def destroy
      @pattern = Pattern.find(params[:id])
      @pattern.destroy
      
      redirect_to patterns_path
  end
    
  def edit
      @pattern = Pattern.find(params[:id])
  end
  
  def update
      @pattern = Pattern.find(params[:id])
      
      if @pattern.update(pattern_params)
          redirect_to patterns_path
      else
          render 'edit'
      end
  end
  
  def show
      @pattern = Pattern.find(params[:id])
  end
  
  private
      def pattern_params
          params.require(:pattern).permit(:name, :status, :description, :tags)
      end
end
