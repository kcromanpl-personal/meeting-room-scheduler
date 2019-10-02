class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
    @users_list = User.pluck(:email)
  end

  def create
    @schedule = Schedule.new(schedule_params)

    if @schedule.save
      redirect_to schedules_path
    else
      render 'new'
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
    @users_list = User.pluck(:email)
  end

  def update
    @schedule = Schedule.find(params[:id])

    if @schedule.update(schedule_params)
      redirect_to schedules_path
    else
      render 'edit'
    end
  end

  # Destroy the project
  def destroy
    @schedule= Schedule.find(params[:id])

    if @schedule.destroy
      redirect_to schedules_path
    else
      render 'new'
    end
  end


  private
    def schedule_params
      params.require(:schedule).permit(:name, :agenda, :start_date, :end_date, :start_time, :end_time, :add_users)
    end

end
