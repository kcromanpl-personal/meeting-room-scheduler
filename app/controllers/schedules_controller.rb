class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy ]
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
    @users_list = User.pluck(:email)
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.user_id = current_user.id 

    if @schedule.save
      redirect_to schedules_path
    else
      render 'new'
    end
  end

  def edit
    @users_list = User.pluck(:email)
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to schedules_path
    else
      render 'edit'
    end
  end

  # Destroy the project
  def destroy

    if @schedule.destroy
      redirect_to schedules_path
    else
      render 'new'
    end
  end


  private
  #set schedule
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end
    #set params
    def schedule_params
      params.require(:schedule).permit(:name, :agenda, :start_date, :end_date, :start_time, :end_time, :add_users, :user_id)
    end

end
