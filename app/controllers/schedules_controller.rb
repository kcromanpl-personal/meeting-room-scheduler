class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end
  def new
    @schedule = Schedule.new
    @users_list = User.pluck(:email)
  end
  def edit
    @schedule = Schedule.find(params[:id])
  end
end
