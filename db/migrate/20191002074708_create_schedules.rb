class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string :name
      t.string :agenda
      t.datetime :start_date
      # t.datetime :end_date
      t.datetime :start_time
      t.datetime :end_time
      t.string :add_users


      t.timestamps
    end
  end
end
