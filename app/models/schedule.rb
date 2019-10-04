class Schedule < ApplicationRecord
     belongs_to :meeting_room
     acts_as_commontator
     acts_as_commontable dependent: :destroy
end
