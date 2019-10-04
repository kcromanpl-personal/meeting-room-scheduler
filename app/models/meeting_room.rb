class MeetingRoom < ApplicationRecord

    belongs_to :user
     has_many :schedules, dependent: :destroy 
     validates :name,:description, presence: true      
end
