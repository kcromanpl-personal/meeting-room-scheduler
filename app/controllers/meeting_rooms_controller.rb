class MeetingRoomsController < ApplicationController
  before_action :set_meeting,  only: [:show, :edit, :update, :destroy ]
  def index
    @meeting_rooms = MeetingRoom.all
  end

  def new
    @meeting_room = MeetingRoom.new
  end

  # Create new project & save it to database
  def create
    @meeting_room = MeetingRoom.new(room_params)
    @meeting_room.user_id = current_user.id
    if @meeting_room.save
      redirect_to meeting_rooms_path
    else
      render 'new'
    end
  end

  # Edit the exisiting project
  def edit
   
  end

  # Update the existing project 
  def update
   
    if @meeting_room.update(room_params)
      redirect_to meeting_rooms_path
    else
      render 'edit'
    end
  end
  
  # Destroy the project
  def destroy
    if @meeting_room.destroy
      redirect_to meeting_rooms_path
    else
      render 'new'
    end
  end

  private
  #strong parameters

  #set meeting rooom
  def set_meeting
    @meeting_room = MeetingRoom.find(params[:id])
  end

  def room_params
    params.require(:meeting_room).permit(:name, :description, :user_id)
  end
end
