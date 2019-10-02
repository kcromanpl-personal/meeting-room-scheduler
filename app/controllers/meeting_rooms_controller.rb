class MeetingRoomsController < ApplicationController
  
  def index
    @meeting_rooms = MeetingRoom.all
  end

  def new
    @meeting_room = MeetingRoom.new
  end

  # Create new project & save it to database
  def create
    @meeting_room = MeetingRoom.new(room_params)
    if @meeting_room.save
      redirect_to meeting_rooms_path
    else
      render 'new'
    end
  end

  # Edit the exisiting project
  def edit
    @meeting_room = MeetingRoom.find(params[:id])
  end

  # Update the existing project 
  def update
    @meeting_room = MeetingRoom.find(params[:id])

    if @meeting_room.update(room_params)
      redirect_to meeting_rooms_path
    else
      render 'edit'
    end
  end
  
  # Destroy the project
  def destroy
    @meeting_room = MeetingRoom.find(params[:id])

    if @meeting_room.destroy
      redirect_to meeting_rooms_path
    else
      render 'new'
    end
  end

  private
  #strong parameters
  def room_params
    params.require(:meeting_room).permit(:name, :description)
  end
end
