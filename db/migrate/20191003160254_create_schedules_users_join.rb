class CreateSchedulesUsersJoin < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules_users, :id => false do |t|
      t.integer "user_id"
      t.integer "schedule_id"

    end
    add_index("schedules_users", ["user_id", "schedule_id"])
  end
end