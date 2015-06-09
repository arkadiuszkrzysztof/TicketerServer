class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end
    
  def show
  end
end
