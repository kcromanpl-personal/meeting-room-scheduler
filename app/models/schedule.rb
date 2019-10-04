class Schedule < ApplicationRecord
     belongs_to :meeting_room
     acts_as_commontator
     acts_as_commontable dependent: :destroy

     #m:n with user
      # User Associations: 
     has_and_belongs_to_many :users
     validates :name, :agenda,  presence: true     

end
