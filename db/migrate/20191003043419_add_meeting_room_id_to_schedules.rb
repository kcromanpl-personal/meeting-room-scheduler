class AddMeetingRoomIdToSchedules < ActiveRecord::Migration[6.0]
  def change
    add_reference :schedules, :meeting_room, null: false, foreign_key: true
  end
end
