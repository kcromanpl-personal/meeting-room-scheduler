class Schedule < ApplicationRecord
     belongs_to :meeting_room
<<<<<<< HEAD
     acts_as_commontator
     acts_as_commontable dependent: :destroy
=======

     #m:n with user
      # User Associations: 
     has_and_belongs_to_many :users
     validates :name, :agenda,  presence: true     

>>>>>>> 1a26f3dda2f9acd6b56f27bb97cd5f0e1b824160
end
