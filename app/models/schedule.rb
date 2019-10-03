class Schedule < ApplicationRecord
     belongs_to :meeting_room

     #m:n with user
      # User Associations: 
     has_and_belongs_to_many :users
end
