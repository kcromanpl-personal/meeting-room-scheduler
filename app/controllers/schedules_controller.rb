class SchedulesController < ApplicationController
  before_action :set_meeting_room

  # before_action :set_schedule, only: [:show, :edit, :update, :destroy ]

  def index
    @schedules = @meeting_room.schedules.all
  end

  def new
    @schedule = @meeting_room.schedules.new
    @users_list = User.pluck(:email)
  end

  def create
    #create function

    @schedule = @meeting_room.schedules.new(schedule_params)
    @schedule.user_id = current_user.id 

    if @schedule.save
      redirect_to meeting_room_schedules_path(@meeting_room)
    else
      render 'new'
    end
  end
 #edit
  def edit  
    @schedule = @meeting_room.schedules.find(params[:id])  
    @users_list = User.pluck(:email)  
  end

#update 
  def update
    @schedule = @meeting_room.schedules.find(params[:id])

    if @schedule.update(schedule_params)
      redirect_to meeting_room_schedules_path
    else
      render 'edit'
    end
  end

  # Destroy the project
  def destroy
    @schedule = @meeting_room.schedules.find(params[:id])
    if @schedule.destroy
      redirect_to meeting_room_schedules_path
    else
      render 'new'
    end
  end


  private
  #set Meeting Room
    def set_meeting_room
      @meeting_room = MeetingRoom.find(params[:meeting_room_id])
    end
  #set schedule
    # def set_schedule
    #   @schedule = Schedule.find(params[:id])
    # end
    #set params
    def schedule_params
      params.require(:schedule).permit(:name, :agenda, :start_date, :end_date, :start_time, :end_time, :add_users, :user_id)
    end

end
