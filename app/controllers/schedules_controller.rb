class SchedulesController < ApplicationController
  before_action :set_meeting_room, except: [:all_schedules]
  # before_action :set_schedule, only: [:show, :edit, :update, :destroy ]

  def index
    @schedules = @meeting_room.schedules.all
  end

  def all_schedules
    @schedules = Schedule.all
  end

  def new
    @schedule = @meeting_room.schedules.new
    commontator_thread_show(@schedule)
    @users_list = User.pluck(:email)
  end

  def show
    @schedule = @meeting_room.schedules.find(params[:id])
    commontator_thread_show(@schedule)
  end

  def create
    #create function
    
    @schedule = @meeting_room.schedules.new(schedule_params)
<<<<<<< HEAD
    @schedule.user_id = current_user.id
    commontator_thread_show(@schedule)
=======
    # @meeting.user = current_user
    # binding.pry
    # @schedule.user = current_user.id
    
>>>>>>> 1a26f3dda2f9acd6b56f27bb97cd5f0e1b824160
    @users_list = User.pluck(:email)

    if @schedule.save
      # UserMailer.with(user: @user).welcome_email.deliver_later
      UserMailer.send_mail(@schedule, @users_list).deliver_now
      redirect_to meeting_room_schedules_path
    else
      render 'new'
    end
  end
 #edit
  def edit  
    
    @schedule = @meeting_room.schedules.find(params[:id])  
    commontator_thread_show(@schedule)
    @users_list = User.pluck(:email)  
  end

#update 
  def update
    @schedule = @meeting_room.schedules.find(params[:id])
    @users_list = User.pluck(:email)

    if @schedule.update(schedule_params)
      UserMailer.send_mail(@schedule, @users_list).deliver_now
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
      params.require(:schedule).permit(:name, :agenda, :start_date, :start_time, :end_time, :add_users)
    end

end
